import 'package:flutter/material.dart';
import 'package:grocery_frontend/homewidget.dart';
import 'apicall.dart';
import 'productCard.dart';

class Fruits extends StatelessWidget {
  Future getProducts() async {
    var Products = await ProductProvider(this.apiPath).fetchProducts();
    var map = new Map();
    var subCategories = new Set();
    var widgets = <Widget>[];

    for (var i = 0; i < Products.length; i++) {
      subCategories.add(Products[i].subcategory);
    }
    for (var i = 0; i < subCategories.length; i++) {
      var products = Products.where(
              (element) => element.subcategory == subCategories.elementAt(i))
          .toList();
      map[subCategories.elementAt(i)] = products;
    }
    map.forEach((key, value) {
      widgets.add(Text(key));
      for (var i = 0; i < value.length; i++) {
        widgets.add(ProductCard(
          value[i].name,
          value[i].price,
          value[i].image,
          Colors.white,
        ));
      }
    });
    return Column(
      children: widgets,
    );
  }

  final apiPath;

  Fruits(this.apiPath) {
    getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[700],
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Login'),
              trailing: Icon(
                Icons.login_rounded,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('About'),
              trailing: Icon(
                Icons.info_outline_rounded,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Contact Us'),
              trailing: Icon(
                Icons.phone_rounded,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              trailing: Icon(
                Icons.logout_rounded,
              ),
              onTap: () {},
            ),
          ],
        )),
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
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.account_circle,
                  ),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                              borderSide:
                                  BorderSide(color: Colors.white, width: 5.0),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 5.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                  future: getProducts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data;
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
