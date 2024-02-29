import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/authentication/authscreen.dart';
import 'package:group_expense_tracker/bloc/groups_bloc.dart';
import 'package:group_expense_tracker/home_page/home.dart';
import 'package:group_expense_tracker/splash_screen.dart';
import 'package:group_expense_tracker/themedata.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const SplashScreen();
          }
          if(snapshot.hasData)
          {
            return BlocProvider(
                create: (context) => GroupBloc()..add(LoadGroups()),
                child: const HomeScreen(),
              );
          }
          else
          {
            return const AuthScreen();
          }
        }
      ),
    );
  }
}
