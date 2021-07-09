import 'package:flutter/material.dart';
import 'package:grocery_frontend/homewidget.dart';
import 'apicall.dart';


class Fruits extends StatelessWidget {
void getProducts () async {
var Products = await ProductProvider(this.apiPath).fetchProducts();
for(var i=0; i< Products.length; i++){
  print(Products[i].name);
}
}
final apiPath;

Fruits(this.apiPath)
{
  getProducts();
}
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


            ],
          ),
        ),
        )
    );
  }
}
