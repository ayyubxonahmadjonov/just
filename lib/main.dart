import 'package:real_project/app.dart';

import 'core/constants/app_imports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper().init();
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812), // iPhone 11 Pro Max screen size as base
      minTextAdapt: true,
      builder: (_, __) => MyApp(),
    ),
  );
}
