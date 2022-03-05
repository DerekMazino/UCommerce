import 'package:flutter/material.dart';

class Adminproductos extends StatefulWidget {
  const Adminproductos({Key? key}) : super(key: key);

  @override
  State<Adminproductos> createState() => _Adminproductos();
}

class _Adminproductos extends State<Adminproductos> {
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
                  color: Colors.grey,
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
          SizedBox(height: 20),   
          Text("Productos",
            textAlign: TextAlign.left, 
            style: TextStyle(                  
            decoration: TextDecoration.none,
            fontSize: 30.0,
            fontFamily: 'OpenSans',                  
          ),),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DataTable(
                  sortAscending: false,
                  columns: [
                    DataColumn(label: Text("Consulta")),
                  ],
                  rows: [
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text("10 productos mas vendidos")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("10 productos menos vendidos")),
                    ])
                  ],
                ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Desde:"),
                  ),
                  Container(
                  decoration: BoxDecoration( 
                    color:  Colors.grey,                  
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("01-01-2020"),
                  )
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Hasta:"),
                  ),
                  Container(
                  decoration: BoxDecoration(   
                    color:  Colors.grey,                
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("01-01-2022"),
                  )
                  ),
                ],
              )
            ],
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
                        Text("Generar reporte",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),      
                ),
          ),

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