import 'package:flutter/material.dart';
class Fruits extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[700],
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('G', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.green[900],
          elevation: 0.0,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.shopping_cart_rounded,
                    size: 26.0,
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.account_circle,
                  ),
                )
            ),
          ],
        ),
        body:SingleChildScrollView(child: Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 330,
                    child: TextField(
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 5.0),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 5.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),

              GestureDetector(child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: 325,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white)
                    ),
                    child: Image(image: AssetImage('assets/vegetables.jpg'),
                        fit: BoxFit.fill),
                  ),
                  Container(
                      height: 200,
                      width: 325,
                      child: Center( child: Text('Fresh Fruits', style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
                ],),
                  ),
              SizedBox(height: 50,),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 325,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(image: AssetImage('assets/vegetables.jpg'),
                            fit: BoxFit.fitHeight)),
                  ),
                  Container(
                      height: 200,
                      width: 325,
                      child: Center( child: Text('Fresh Vegetables', style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
                ],),
              SizedBox(height: 50,),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 325,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white)
                    ),
                    child: Image(image: AssetImage('assets/vegetables.jpg'),
                        fit: BoxFit.fill),
                  ),
                  Container(
                      height: 200,
                      width: 325,
                      child: Center( child: Text('Exotic Fruits', style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
                ],),
              SizedBox(height: 50,),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 325,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white)
                    ),
                    child: Image(image: AssetImage('assets/vegetables.jpg'),
                        fit: BoxFit.fill),
                  ),
                  Container(
                      height: 200,
                      width: 325,
                      child: Center( child: Text('Exotic Vegetables', style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
                ],)

            ],
          ),
        ),
        )
    );
  }
}