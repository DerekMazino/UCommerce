import 'package:flutter/material.dart';

class Objeto extends StatefulWidget {

  const Objeto({Key? key}) : super(key: key);

  @override
  State<Objeto> createState() => _Objeto();
}

class _Objeto extends State<Objeto> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Container(
        
        child: Column(          
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                Expanded( 
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "buscar",
                      border: InputBorder.none
                    ),
                  ),
                ),
                  Icon(Icons.search),
                ],),
            ),
            SizedBox(height: 16),           
            SizedBox(height: 16),
            TargetList()
        ],),
      ),
      ),
    );
  }

  Widget TargetList(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: <Widget>[ 
          tar("https://t2.rg.ltmcdn.com/es/posts/6/8/2/galletas_de_mantequilla_con_chocolate_55286_orig.jpg"),
          tar("https://cdn.aarp.net/content/dam/aarp/home-and-family/caregiving/2016/11/1140-woman-kissing-sick-mother-esp.jpg"),
          tar("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg"),
          tar("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg"),
          tar("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg"),
          tar("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg"),
          ],
        ),
    );
  }

  Widget tar(String url){
    return GridTile(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
            child: Image.network(url, fit: BoxFit.cover,),
      ),
      ),  
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl, title;
  CategoriesTile({this.title = "", this.imgUrl = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Image.network(imgUrl)
          ),
          Container(
            child: Text(title),
          ),
      ],),
    );
  }
}