import 'package:get_storage/get_storage.dart';

// A Simple Demonstration

class IntroService {
  /// I have used GetStorage for this but you can replace this with anything
  /// you want here like sharedprefs or hive;

  static const String _INTRO_DONE_KEY = 'intro_done';

  /// This will save to local device
  static Future<void> saveIntroHasBeeenViewed() async {
    final box = GetStorage();
    box.write(_INTRO_DONE_KEY, true);
  }

  /// IF the intro is already showed
  static bool isIntroDone() {
    final box = GetStorage();
    bool _isIntroDone = false;
    _isIntroDone = box.read(_INTRO_DONE_KEY) ?? false;
    return _isIntroDone;
  }
}
