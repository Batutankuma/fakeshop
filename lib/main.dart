import 'package:fakeshop/components/navigation_view.dart';
import 'package:fakeshop/constant.dart';
import 'package:fakeshop/firebase_options.dart';
import 'package:fakeshop/views/login_views.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FakeShop',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 198, 230, 222),
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
        iconTheme: const IconThemeData(color: Colors.tealAccent),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      initialRoute: fireAuth.currentUser == null ? '/' : '/index',
      routes: {
        '/': (context) => LoginView(),
        '/index': (context) => const NavigationBarView()
      },
    );
  }
}
