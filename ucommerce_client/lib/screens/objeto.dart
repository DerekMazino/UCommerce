import 'package:flutter/material.dart';

class Objeto extends StatefulWidget {

  const Objeto({Key? key}) : super(key: key);

  @override
  State<Objeto> createState() => _Objeto();
}

class _Objeto extends State<Objeto> {
  int _selectedIndex = 2;
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
    
    return Scaffold( 
      
      backgroundColor: Colors.white,
      body: Column(
        children: [
        
        Stack(
          children: [
            Container(
            height: 350,
            child: ClipRRect(            
            borderRadius: BorderRadius.circular(16),
            child: Image.network("https://i.pinimg.com/originals/93/b5/f9/93b5f9913d2e4316cd6e541c67b9aed0.jpg", fit: BoxFit.cover,),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 16),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(                   
                    color: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {}, 
                    child: Icon(Icons.arrow_back_ios),       
                  ),
                  SizedBox(width: 180,),
                  FlatButton(
                    color: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {}, 
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        Icon(Icons.list),
                      ],
                    ),       
                  ),
                ],
              ),
          ],),                    
        ],), 
        SizedBox(height: 8), 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Galletas con chispas", style: TextStyle(fontSize: 30),),
            MaterialButton(                   
                    color: Colors.white,
                    shape: CircleBorder(side: BorderSide(width: 0)),
                    padding: EdgeInsets.all(0),
                    onPressed: () {}, 
                    child: Icon(Icons.favorite, color: Colors.pink[200]),      
                  ),
        ],),
        SizedBox(height: 8),
        Row(
          children: [
            SizedBox(width: 8),
            Text("Luisa alvares", style: TextStyle(fontSize: 15),),
          ],
        ),
        Row(         
          children: [
            SizedBox(width: 8),
            Text("Ricas galletas de sabor a vainilla con chispas de \n chocolate", style: TextStyle(fontSize: 15),),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 8),
            Text("Todos los dias a las 4p.m. en biblioteca, no te lo \n pierdas", style: TextStyle(fontSize: 15),),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Unidades", style: TextStyle(fontSize: 15),),
            MaterialButton(                   
                    color: Colors.white,
                    shape: CircleBorder(side: BorderSide(width: 0)),
                    padding: EdgeInsets.all(0),
                    onPressed: () {}, 
                    child: Icon(Icons.add),      
                  ),
            Text("1", style: TextStyle(fontSize: 15),),
            MaterialButton(                   
                    color: Colors.white,
                    shape: CircleBorder(side: BorderSide(width: 0)),
                    padding: EdgeInsets.all(0),
                    onPressed: () {}, 
                    child: Icon(Icons.remove),      
                  ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$3.6k", style: TextStyle(fontSize: 15, color: Colors.blue),),
            SizedBox(width: 16),
            MaterialButton(                   
                    color: Colors.purple[700],
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.all(0),
                    onPressed: () {}, 
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(                      
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.shopping_cart, color: Colors.white,),
                          ),
                          Text("añadir a la cesta",style: TextStyle(color: Colors.white),)
                        ],
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