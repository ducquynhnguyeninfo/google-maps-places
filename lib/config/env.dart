enum EnvMode { production, development, profile }

class Env {
  static EnvMode mode = EnvMode.development; // can changed in main

  static Map<String, String> _prod = {
    'api_key': 'AIzaSyCm5BcKJw3P4bwbKBC73E7W0aDfUsxqy4Y' // whizz-5-test
  };

  static Map<String, String> _dev = {
    'api_key': 'AIzaSyDyyIWmZCLa5lPxkCwpDS3wmdKhXClBoFY' // whizz-4-dev
  };

  static Map<String, String> _prof = {};

  // pretend we put the key all right
  static String get(String key) {
    switch (mode) {
      case EnvMode.development:
        return _dev[key]!;
      case EnvMode.production:
        return _prod[key]!;
      case EnvMode.profile:
        return _prof[key]!;
      default:
        return _prod[key]!;
    }
  }
}
