import 'package:flutter/material.dart';

class Carro extends StatefulWidget {

  const Carro({Key? key}) : super(key: key);

  @override
  State<Carro> createState() => _Carro();
}

class _Carro extends State<Carro> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1;
  int counter = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const fontsize30 = TextStyle(fontSize: 30);
    return Scaffold(         
      key: _key,
      drawer: Drawer(), 
      appBar: AppBar(      
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.menu, color: Colors.black)
            ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.notifications, color: Colors.black)
            ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.send, color: Colors.black)
            ),
        ],),    
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
                        
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                      Column(
                        children: [
                          ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget>[                      

                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Carta()
                        ],
                      ),
                  ],),
                ],),
            ],),
        ],),
      ),
    );                              
  } 
}

class Carta extends StatelessWidget {
  const Carta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 220,
        width: 170,                       
        child: Column(
          children: <Widget>[
            Container(
              height: 170,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/man.jpg"),),
              ),
            ),
            Text("\$ 30.000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xff9b96d6),),
            ),
            Text("Man Long T-Shirt"),
          ],
        ),
      ),               
    );
  }
}