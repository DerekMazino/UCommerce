import 'package:flutter/material.dart';

class Tiendavendedor extends StatefulWidget {

  const Tiendavendedor({Key? key}) : super(key: key);

  @override
  State<Tiendavendedor> createState() => _Tiendavendedor();
}

class _Tiendavendedor extends State<Tiendavendedor> {
  int _selectedIndex = 2;

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
          SizedBox(height: 15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 12,),
              Icon(Icons.edit),
            ],
          ),

          Padding(padding: EdgeInsets.only(
            top: 15,
            left: 30,
            right: 30,
          ),
            child: 
            buildSearch(),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                MaterialButton(                   
                    color: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 4),
                    borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {}, 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.store),
                    ),       
                  ),
                Text(
                  "UnaTiendaCool", 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    fontFamily: 'OpenSans',
                    
                  ),
                ),
                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Una descripcion aqui", 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                  ),
                ),
            ],),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
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
                    Text("Vender",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),      
            ),
          ),
          
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "UnaSeccion", 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
          ],),

          SizedBox(height: 12),

          Container(
            height: 200,
            child: 
              ListView(
                scrollDirection: Axis.horizontal,
                children: [                                        
                  buildCard(),                  
                  buildCard(),                  
                  buildCard(),                  
                  buildCard(),                              
                ],
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