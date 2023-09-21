import 'package:flutter/material.dart';
import 'package:payment/fictive/data.dart';
import 'package:payment/ui/principal/principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Principal(transactionData: transactionData, handleSettingsPress: () {}, handleStatPress:() {} ),
    );
  }
}

