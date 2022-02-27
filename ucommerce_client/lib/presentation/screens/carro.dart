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
  bool valuefirst = false;   


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void clicCheck(bool value) {
    setState(() {
      valuefirst = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    const fontsize30 = TextStyle(fontSize: 30);
    return Scaffold(         
       
      body: Stack(
        children: [
      ListView(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_ios),               
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0),
                child: Text("Carrito"),
              ),
              Icon(Icons.delete),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                    SizedBox(width: 70),
                    Container(
                      height: 100,
                      width: 100,
                      child: ClipRRect(            
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg", fit: BoxFit.cover,),
                      ),
                    ),
                    Column(
                      children: [
                        Text("galletas con chispas"),
                        Text("ricas galletas de sabor \n vainilla con chispas..."),
                        SizedBox(height: 6.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(                   
                              color: Colors.blue,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(0),
                              onPressed: () {}, 
                              child: Icon(Icons.add),      
                            ),
                            Text("1", style: TextStyle(fontSize: 15),),
                            MaterialButton(                   
                              color: Colors.blue,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(0),
                              onPressed: () {}, 
                              child: Icon(Icons.remove),      
                            ),
                          ],

                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],), 
        Column(          
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(                   
                color: Colors.purple[700],
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.all(0),
                onPressed: () {}, 
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pagar",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),      
              ),
            ),            
          ],
        ),

        ],), 
        bottomNavigationBar: BottomNavigationBar(        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(            
            icon: Icon(Icons.home),
            label: 'Home',  
            backgroundColor: Colors.amber,         
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Ventas',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Compra',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_sharp),
            label: 'Perfil',
            backgroundColor: Colors.amber,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[900],
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.amber,
        onTap: _onItemTapped,
      ), 
    );                              
  } 
}



    
