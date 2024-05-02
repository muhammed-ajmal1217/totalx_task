import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/authgate.dart';
import 'package:totalx_machine_task/controller/auth_provider.dart';
import 'package:totalx_machine_task/controller/data_controller.dart';
import 'package:totalx_machine_task/firebase_options.dart';
import 'package:totalx_machine_task/views/home_page.dart';
import 'package:totalx_machine_task/views/login_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
        ChangeNotifierProvider(create: (context) => DataProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}