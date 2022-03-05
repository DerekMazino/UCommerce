import 'package:flutter/material.dart';

class Pedido extends StatefulWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  State<Pedido> createState() => _Pedido();
}

class _Pedido extends State<Pedido> {
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
      body: SingleChildScrollView(
        child:
        Column(
        children: [ 
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_ios),               
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0),
                child: Text("Carrito"),
              ),
            ],
          ),   
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("N° Pedido: 80000000000"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Fecha de pedido: 2022 - 01 - 01 17:00"),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 170,
                          width: 180,
                          child: ClipRRect(            
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg", fit: BoxFit.cover,),
                          ),
                        ),
                      Container(
                          child: Column(
                            children: [
                              Text("galletas con chispas", style: TextStyle(fontWeight: FontWeight.bold,),),
                              Text("ricas galletas de sabor \n vainilla con chispas...", textAlign: TextAlign.left,),
                              SizedBox(height: 20.0,),
                              Text("\$3.6k x1", style: TextStyle(fontSize: 15, color: Colors.blue),),
                            ]
                          ),
                        ),
                    ],
                  ),
                  MaterialButton(                   
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.all(0),
                    onPressed: () {}, 
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Confirmar pedido", style: TextStyle(color: Colors.white),),
                      ],),
                    ),      
                  ),
              ],),
            ),
          ),







          
                   
        ],),),           
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
    )  ;     
  }      
}