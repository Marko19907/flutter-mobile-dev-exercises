import 'package:flutter/material.dart';
import 'package:exercise_e4/app_logic.dart';

class E4App extends StatelessWidget {
  const E4App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise E4',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile page",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {
              _signOut(context);
            },
            icon: const Icon(
              Icons.logout,
              size: 32,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Image(image: AssetImage('images/chuck.jpg')),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [ElevatedButton(
              onPressed: () {
                _changePicture(context);
              },
              child: const Text(
                "Change profile picture",
              ),
            )],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showHelp(context);
        },
        child: const Icon(
          Icons.help_outline,
          size: 44,
        ),
      ),
    );
  }

  /// Show help page/dialog
  /// Note for students: don't modify this method!
  void _showHelp(BuildContext context) {
    // The widget calls the necessary operation in the app-logic class
    AppLogic.instance().showHelp();
    _showDialogMessage("Showing help...", context);
  }

  /// Simulate sign-out
  /// Note for students: don't modify this method!
  void _signOut(BuildContext context) {
    AppLogic.instance().signOut();
    _showDialogMessage("Signing out...", context);
  }

  /// Simulate profile picture change
  /// Note for students: don't modify this method!
  void _changePicture(BuildContext context) {
    AppLogic.instance().changePicture();
    _showDialogMessage("Changing the picture...", context);
  }

  void _showDialogMessage(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}
