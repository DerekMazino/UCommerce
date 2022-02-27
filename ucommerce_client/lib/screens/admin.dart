import 'package:flutter/material.dart';

class Admin extends StatefulWidget {

  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _Admin();
}

class _Admin extends State<Admin> {
  int _selectedIndex = 0;
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
          
          Row(
            children: [
              Container(
                child: ClipRRect(            
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Icon(Icons.store),
                ),
                ),
              ),
              Container(
                child: ClipRRect(            
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Icon(Icons.shopping_bag),
                ),
                ),
              ),
            ],
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
            icon: Icon(Icons.supervised_user_circle_sharp),
            label: 'Perfil',
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