import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _Admin();
}

class _Admin extends State<Admin> {
  int _selectedIndex = 0;

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
      body: Stack(
        children: [     
      Column(
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
          Row(
            children: [
              SizedBox(width: 12),
              Text(
                " Informe", 
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15.0,
                  fontFamily: 'OpenSans',
                ),
              ),
          ],),
          SizedBox(height: 10),          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.amber,
                  child: ClipRRect(            
                  borderRadius: BorderRadius.circular(70),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Icon(Icons.store, size:50),
                  ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.blue,
                  child: ClipRRect(            
                  borderRadius: BorderRadius.circular(70),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Icon(Icons.shopping_bag, size:50),
                  ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),          
      ],), 
        ]),                    
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
    )  ;     
  }      
}