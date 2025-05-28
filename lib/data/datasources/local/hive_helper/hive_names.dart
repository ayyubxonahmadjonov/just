import 'package:hive/hive.dart';

class HiveBoxes {
  const HiveBoxes._();

  static final Box<double> monthly_capitals = Hive.box(
    HiveBoxNames.monthly_capitals,
  );
  static final Box<double> monthly_invests = Hive.box(
    HiveBoxNames.monthly_invests,
  );
}

class HiveBoxNames {
  static const String monthly_invests = "month_invests";
  static const String monthly_capitals = "monthly_capitals";
}
