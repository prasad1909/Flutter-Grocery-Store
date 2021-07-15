import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatelessWidget {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var cart;

  Future getCart() async {
    SharedPreferences preferences = await _prefs;
    cart = await preferences.getKeys();
    var list = <Widget> [];
    for (var item in cart) {
      list.add(Text(item));
    }
    return Column(children: list,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green[700],
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
                  Icons.account_circle,
                ),
              )
          ),
        ],
      ),
      body: FutureBuilder(future: getCart(),
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
          }
      ),
    );

  }
}
