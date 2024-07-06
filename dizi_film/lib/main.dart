import 'package:dart_openai/dart_openai.dart';
import 'package:dizi_film/yeni_ana.dart';
import 'package:dizi_film/yeni_anasayfa.dart';
import 'package:dizi_film/yonlendirme.dart';
import 'package:flutter/material.dart';

void main() {
  OpenAI.apiKey = "";
  OpenAI.showLogs = true;
  OpenAI.showResponsesLogs = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const YonlendirButon(),
    );
  }
}
