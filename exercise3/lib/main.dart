import 'package:flutter/material.dart';

void main() {
  runApp(const E3SolutionApp());
}

class E3SolutionApp extends StatelessWidget {
  const E3SolutionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E3 solution',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _getHome(),
    );
  }

  Widget _getHome() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E3 Solution"),
      ),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(children: <Widget>[
          const SizedBox(height: 32),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              child: const Text(
                "Student Marko",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              child: const Text(
                "You don't disable Chuck Norris",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              child: const Text(
                "Chuck disables you",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ))
        ]),
      ),
    );
  }
}
