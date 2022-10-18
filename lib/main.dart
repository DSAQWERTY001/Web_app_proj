import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_prototype/Screens/Create_Vote/create_vote.dart';
import 'package:web_prototype/Screens/Home/home_screen.dart';
import 'package:web_prototype/Screens/routing/routes.dart';
import 'Screens/Login/login_screen.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/vote/create': (context) => createVoteScreen(),
        '/vote/dashboard': (context) => createVoteScreen(),
      },
      title: 'Vote Web Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}
