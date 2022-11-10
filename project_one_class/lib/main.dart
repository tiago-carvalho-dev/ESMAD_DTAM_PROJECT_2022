import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Card ID"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          12,
          24,
          12,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/profile_image.png",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Name:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Tiago Carvalho",
              style: TextStyle(fontSize: 16, color: Colors.indigo),
            ),
            Divider(
              height: 30,
              thickness: 4,
              color: Colors.green[800],
            ),
            Row(
              children: [
                const Icon(
                  Icons.email_rounded,
                  color: Colors.lightBlue,
                  size: 42,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "TRC@ESMAD.IPP.PT",
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.yellow[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
