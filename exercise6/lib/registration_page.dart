import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final englishAlphabet = RegExp(r'^[a-zA-Z]+$');
  final emailCheck = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");

  final lowercase = RegExp(r'(.*[a-z].*)');
  final uppercase = RegExp(r'(.*[A-Z].*)');
  final digit = RegExp(r'(.*\d.*)');

  final usernameErrorMsg = "invalid username";
  final emailErrorMsg = "invalid email format";
  final passwordErrorMsg = "6-20 chars, uppercase, lowercase, digits";

  /// The form has been submitted successfully.
  bool submitted = false;

  /// The user has interacted with the form for the first time,
  /// (pressed the submit button).
  bool interacted = false;

  /// The input fields are enabled.
  bool fieldsEnabled = true;

  bool get errorFound => interacted
      ? [_checkUsername(), _checkEmail(), _checkPassword()]
          .any((element) => element != null)
      : false;

  void _submit() {
    setState(() {
      interacted = true;
      if (!errorFound) {
        submitted = true;
        fieldsEnabled = false;
      }
    });
  }

  void _forceRender(dynamic any) {
    setState(() {
      // Nothing to do
    });
  }

  /// Checks if the username string is valid according to the given specs.
  String? _checkUsername() {
    if (!interacted) {
      return null;
    }

    final username = _usernameController.text;

    if (username.isEmpty) {
      // return "Username can not be empty!";
      return usernameErrorMsg;
    }
    if (!englishAlphabet.hasMatch(username)) {
      // return "Username must contain only lowercase or uppercase letters from the English alphabet";
      return usernameErrorMsg;
    }
    if (username.length < 3) {
      // return "Username must contain more than 3 chars!";
      return usernameErrorMsg;
    }
    if (username.length > 12) {
      // return "Username can not be longer than 12 chars!";
      return usernameErrorMsg;
    }
    return null;
  }

  /// Checks if the email string is valid according to the given specs.
  String? _checkEmail() {
    if (!interacted) {
      return null;
    }

    final email = _emailController.text;

    if (email.isEmpty) {
      // return "Email can not be empty!";
      return emailErrorMsg;
    }
    if (!emailCheck.hasMatch(email)) {
      // return "Email must be a valid email address!";
      return emailErrorMsg;
    }
    return null;
  }

  /// Checks if the password string is valid according to the given specs.
  String? _checkPassword() {
    if (!interacted) {
      return null;
    }

    final password = _passwordController.text;

    if (password.isEmpty) {
      // return "Password can not be blank!";
      return passwordErrorMsg;
    }
    if (password.length < 6) {
      // return "Password must be longer than 6 chars!";
      return passwordErrorMsg;
    }
    if (password.length > 20) {
      // return "Password can not be longer than 20 chars!";
      return passwordErrorMsg;
    }
    if (!lowercase.hasMatch(password)) {
      // return "Password must contain at least one lowercase char!";
      return passwordErrorMsg;
    }
    if (!uppercase.hasMatch(password)) {
      // return "Password must contain at least one uppercase char!";
      return passwordErrorMsg;
    }
    if (!digit.hasMatch(password)) {
      // return "Password must contain at least one digit!";
      return passwordErrorMsg;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    key: const Key("username_input"),
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      errorText: _checkUsername(),
                    ),
                    enabled: fieldsEnabled,
                    onChanged: _forceRender,
                  ),
                  TextField(
                    key: const Key("email_input"),
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      errorText: _checkEmail(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    enabled: fieldsEnabled,
                    onChanged: _forceRender,
                  ),
                  TextField(
                    key: const Key("password_input"),
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      errorText: _checkPassword(),
                    ),
                    enabled: fieldsEnabled,
                    onChanged: _forceRender,
                  ),
                  const SizedBox(height: 16),
                  !submitted
                      ? ElevatedButton(
                        key: const Key("submit_button"),
                        onPressed: errorFound ? null : _submit,
                        child: const Text("Submit form"),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
