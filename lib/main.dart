
import 'package:blood_donation/controller/connectivity_provider.dart';
import 'package:blood_donation/controller/donor_provider.dart';
import 'package:blood_donation/view/editscreen/edit.dart';
import 'package:blood_donation/view/homescreen/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DonorProvider(),),
        ChangeNotifierProvider(create: (context) => InternetConnectivityProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/update':(context) =>  EditDonor(),
        },
        home: const HomeScreen(),
      ),
    );
  }
}