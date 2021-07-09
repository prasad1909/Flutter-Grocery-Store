import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fruits.dart';
import 'homewidget.dart';

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
        drawer: Drawer(
            child : ListView(
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
                ), onTap: () {},
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
            )
        ),
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

              HomeWidget('Fruits & Vegetables', 'assets/vegetables.jpg','fruits'),
              HomeWidget('Snacks & Munchies', 'assets/vegetables.jpg',"snacks"),
              HomeWidget('Drink & Beverages', 'assets/vegetables.jpg',"drinks"),
              HomeWidget('Daily Staples', 'assets/vegetables.jpg',"staples"),

            ],
              ),
          ),
        )
        );
  }
}