import 'package:dizi_film/body.dart';
import 'package:flutter/material.dart';
class YeniAnasayfa extends StatefulWidget {
  const YeniAnasayfa({super.key});

  @override
  State<YeniAnasayfa> createState() => _YeniAnasayfaState();
}

class _YeniAnasayfaState extends State<YeniAnasayfa> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(onPressed: () {
    
      }, icon: const Icon(Icons.menu)) ,
    );
  }
}