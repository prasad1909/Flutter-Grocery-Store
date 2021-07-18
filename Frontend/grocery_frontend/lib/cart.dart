import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cartcard.dart';

class Cart extends StatelessWidget {

  Future getCart() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences preferences = await _prefs;
    var cart = await preferences.getKeys();
    var list = <Widget> [];
    for (var item in cart) {
      print(item);
      var properties = await preferences.getStringList(item);
      list.add(CartCard(item,properties?[2], properties?[1] ,properties?[0]));
    }
    return Column(children: list,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF2ED566),
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
        backgroundColor: Color(0xFF24A352),
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
      body: SingleChildScrollView(child: FutureBuilder(future: getCart(),
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
      ),),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>
              (
                  RoundedRectangleBorder
                  (
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.red)
                  )
              )
          ),
          onPressed: () {},
          child: Icon(Icons.check_sharp, size:25 ,),

        ),
      ),

    );

  }
}
