/// A class which simulates some basic app logic and app state
/// Used for testing - to make sure that the on-click handlers are set correctly
class AppLogic {
  bool _signedOut = false;
  bool _pictureChanged = false;
  bool _helpShown = false;

  /// This will be true when signOut() has been called at least once
  bool get isSignedOut => _signedOut;

  /// This will be true when changePicture() has been called at least once
  bool get isPictureChanged => _pictureChanged;

  /// This will be true when showHelp() has been called at least once
  bool get isHelpShown => _helpShown;

  static AppLogic? _instance;

  /// Use this to get a singleton-instance of the class
  static AppLogic instance() {
    _instance ??= AppLogic();
    return _instance!;
  }

  /// Emulate a sign-out operation
  void signOut() {
    _signedOut = true;
  }

  /// Emulate a "change profile picture" operation
  void changePicture() {
    _pictureChanged = true;
  }

  /// Emulate showing Help-instructions
  void showHelp() {
    _helpShown = true;
  }
}
