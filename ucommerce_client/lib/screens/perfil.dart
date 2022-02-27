import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {

  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  int _selectedIndex = 3;
  int counter = 0;

  void _onItemTapped(int index) {
    print(index);
    if(index==1){
    }
    else if(index==2){
    }
    else if(index==3){      
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const fontsize30 = TextStyle(fontSize: 30);
    return Scaffold(            
      body: Column(
        children: [            
           SizedBox(height: 20),
          Row(
            children: [
              Text(
                "  ¡Bienvenido!", 
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 40.0,
                  fontFamily: 'OpenSans',
                  
                ),
              ),
              
            ],
          ),
          Row(
            children: [
              SizedBox(width: 12),
              Text(
                " Usuario", 
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                  fontFamily: 'OpenSans',
                ),
              ),
          ],),
          SizedBox(height: 40),
          Center(
            child: Card(              
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Icon(Icons.person, size: 80,),
              ),
            ),
          ),

          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.all(12.0),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Modo administrador",style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),      
                ),
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

  buildButton(String texto) => RaisedButton(onPressed: (){
    print("RaisedButton");
    },
    color: Colors.amber,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Text(texto, style: TextStyle(color: Colors.white),),
  );

  buildSearch() => Container(            
    alignment: Alignment.center,   
    padding: EdgeInsets.only(
      left: 8.0,
      right: 8.0,
    ), 
    height: 50.0,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(30.0),
    ), 
    child: TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search)
      ),
    ),
  );

  buildCard() => Padding(padding: EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 20,
          ),
            child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      );    
}