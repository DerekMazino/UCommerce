import 'package:flutter/material.dart';

class Comprac extends StatefulWidget {
  const Comprac({Key? key}) : super(key: key);

  @override
  State<Comprac> createState() => _Comprac();
}

class _Comprac extends State<Comprac> {
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Datos del pedido", 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    fontFamily: 'OpenSans',                  
                  ),
                ),
              ),             
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(   
                color:  Colors.grey,                
                borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Juan Rodriguez", style: TextStyle(fontWeight: FontWeight.bold,),),
                        Text("Lab pesados \nUIS, Bucaramanga\n+57 315 0000 000"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Metodos de pago", 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    fontFamily: 'OpenSans',                  
                  ),
                ),
              ),             
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(                
                constraints: BoxConstraints(
                  minWidth: 100, 
                  maxWidth: 180,
                  minHeight: 50,
                  maxHeight: 100,
                ),
                decoration: BoxDecoration(   
                  color:  Colors.green [100],               
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,                   
                    children: [
                      Icon(Icons.payments,),
                      Text("Efectivo"),
                    ],
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minWidth: 100, 
                  maxWidth: 180,
                  minHeight: 50,
                  maxHeight: 100,
                ),
                decoration: BoxDecoration(   
                  color:  Colors.grey,                
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.credit_card,),
                      Text("Tarjeta")
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Articulo 1 de compra
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Luisa Alvarez"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Column(
                      children: [
                        Container(
                          height: 170,
                          width: 180,
                          child: ClipRRect(            
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg", fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text("galletas con chispas", style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("ricas galletas de sabor \n vainilla con chispas...", textAlign: TextAlign.left,),
                            SizedBox(height: 20.0,),
                            Text("\$3.6k", style: TextStyle(fontSize: 15, color: Colors.blue),),
                        ],),
                      ),
                    ),
                ],),
            ),
          ),

          // Articulo 2 de compra
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("ala_accesorios"),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Column(
                      children: [
                        Container(
                          height: 170,
                          width: 180,
                          child: ClipRRect(            
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg", fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("galletas con chispas", style: TextStyle(fontWeight: FontWeight.bold,),),
                        Text("ricas galletas de sabor \n vainilla con chispas...", textAlign: TextAlign.left,),
                        SizedBox(height: 20.0,),
                        Text("\$8k", style: TextStyle(fontSize: 15, color: Colors.blue),),
                    ],),
                ],),
            ),
          ),

          //boton hacer pedido
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
                    Text("Hacer pedido",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),      
            ),
          ),
                   
        ],),         ),           
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