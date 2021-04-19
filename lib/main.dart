import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:spyveb_flutter_demo1/Helper/GlobalVariable.dart';
import 'package:spyveb_flutter_demo1/Helper/Theme.dart';
import 'package:spyveb_flutter_demo1/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("configurations");
  print(GlobalConfiguration().getString("api_base_url"));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalVariable.navState,
      theme: ThemeMixin.getTheme(context),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/Splash',
    );
  }
}
