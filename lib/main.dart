import 'core/constants/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper().init();
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812), // iPhone 11 Pro Max screen size as base
      minTextAdapt: true,
      builder: (_, __) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthLoginBloc()),
        BlocProvider(create: (context) => AuthRegistrBloc()),
        BlocProvider(create: (context) => ResetPasswordBloc()),
        BlocProvider(create: (context) => ComfirmSmscodeBloc()),
        BlocProvider(create: (context) => GetProfileBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
