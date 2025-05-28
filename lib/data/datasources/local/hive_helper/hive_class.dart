import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as pp;
import 'package:real_project/data/datasources/local/hive_helper/hive_names.dart';

class HiveService {
  const HiveService._();
  static Future<void> init() async {
    final dir = await pp.getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    await Hive.openBox<double>(HiveBoxNames.monthly_capitals);
    await Hive.openBox<double>(HiveBoxNames.monthly_invests);
  }
}
