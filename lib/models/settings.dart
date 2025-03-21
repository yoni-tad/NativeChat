import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  @HiveField(0)
  late bool isDarkMode;

  @HiveField(1)
  bool isOneSidedChatMode = true;

  @HiveField(2)
  String apikey = "";

  @HiveField(3)
  int currentLightThemeIndex = 0;

  @HiveField(4)
  int currentDarkThemeIndex = 0;
}
