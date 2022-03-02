import 'package:flutter/material.dart';

class Succes extends StatefulWidget {
  const Succes({Key? key}) : super(key: key);

  @override
  State<Succes> createState() => _Succes();
}

class _Succes extends State<Succes> {

  @override
  Widget build(BuildContext context) {
    const fontsize30 = TextStyle(fontSize: 30);
    return Scaffold(            
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [            
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: ClipRRect(            
              borderRadius: BorderRadius.circular(16),
              child: Image.network("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg", fit: BoxFit.cover,),
              ),
            ),
          ],
        ),               
      ],),                           
    )  ;     
  }      
}