import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  home: NinjaCard(),
));

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  int ninjalevel = 0;

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

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              ninjalevel +=1;
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey[800],
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
                      child: Center( child: Text('Fruits & Vegetables', style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
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
                      child: Center( child: Text('Snacks & Munchies', style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
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
                      child: Center( child: Text('Drink & Beverages', style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
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
                      child: Center( child: Text('Daily Staples', style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
                ],)

                ],
              ),
          ),
        )
        );
  }
}