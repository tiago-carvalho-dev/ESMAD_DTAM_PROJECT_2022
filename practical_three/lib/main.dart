import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(elevation: 0, backgroundColor: Colors.yellow[900])),
      initialRoute: "/",
      routes: {
        "/": (context) => const FrontPage(),
        "/detail": (context) => const DetailPage(),
      },
    );
  }
}

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<Character> images = [];

  Widget getContent(index) {
    return Card(
      child: Hero(tag: "my_hero_tag_${images[index].name}",child: Image.network(images[index].imageUrl)),
    );
  }

  void getData() async {
    var uri = Uri.https("rickandmortyapi.com", "/api/character");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> results = jsonResponse["results"];
      setState(() {
        images = results
            .map((e) => Character(e["image"] as String, e["name"] as String))
            .toList();
      });
    } else {
      print("Some error occured");
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty"),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      body: images.isEmpty
          ? const Center(
              child: Text("No content!!"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: getContent(index),
                  onTap: () =>
                      Navigator.pushNamed(context, "/detail", arguments: {
                    "character": images[index],
                  }),
                );
              },
              itemCount: images.length,
            ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    Character character = args["character"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        backgroundColor: Colors.yellow[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "my_hero_tag_${character.name}",
              child: Image.network(
                character.imageUrl,
                height: 240,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("Name:"),
            const SizedBox(
              height: 20,
            ),
            Text(character.name),
          ],
        ),
      ),
    );
  }
}

class Character {
  String imageUrl;
  String name;

  Character(this.imageUrl, this.name);
}
