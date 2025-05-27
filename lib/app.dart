import 'package:real_project/core/constants/app_imports.dart';
import 'package:real_project/main.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    token = SharedPreferencesHelper().getString("access");
  }

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
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),

        debugShowCheckedModeBanner: false,
        home: token == null ? SplashScreen() : HomePage(),
      ),
    );
  }
}
