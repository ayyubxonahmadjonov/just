import 'package:real_project/app.dart';
import 'package:real_project/data/datasources/local/hive_helper/hive_class.dart';

import 'core/constants/app_imports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await SharedPreferencesHelper().init();
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MyApp(),
    ),
  );
}
