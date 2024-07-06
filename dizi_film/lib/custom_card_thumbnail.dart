import 'package:flutter/material.dart';

class CustomCardThumbnail extends StatelessWidget {
  String imageAsset;
   CustomCardThumbnail({super.key,required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.yellow.shade400,
          blurRadius: 5,
          spreadRadius: 1,
          offset: const Offset(0, 3)
        ),],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: 
        AssetImage(imageAsset),fit: BoxFit.cover)
      ),
      margin: const EdgeInsets.only(left:15,right: 15,top: 20,bottom: 30 ),
    );
  }
}