import 'package:hive/hive.dart';
part 'monster.g.dart';

@HiveType(typeId: 0)
class Monster {
  static const int typeId = 0;
  @HiveField(0)
  String name;
  @HiveField(1)
  int level;

  Monster(this.name, this.level);
}