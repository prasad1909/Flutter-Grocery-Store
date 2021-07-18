import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCard extends StatefulWidget {
  final title;
  final image;
  final price;
  var quantity;

  CartCard(this.title, this.image, this.quantity, this.price);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  Future increase() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences preferences = await _prefs;
    await preferences.getStringList(this.widget.title);

    setState(() {
      var q = int.parse(this.widget.quantity);
      q += 1;
      this.widget.quantity = q.toString();
      preferences.setStringList(this.widget.title, [
        this.widget.price,
        this.widget.quantity.toString(),
        this.widget.image.toString()
      ]);
    });
  }

  Future decrease() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences preferences = await _prefs;
    await preferences.getStringList(this.widget.title);

    setState(() {
      var q = int.parse(this.widget.quantity);
      if (q > 0) {
        q -= 1;
        this.widget.quantity = q.toString();
        preferences.setStringList(this.widget.title, [
          this.widget.price,
          this.widget.quantity.toString(),
          this.widget.image.toString()
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.deepOrange, width: 4),
              borderRadius: BorderRadius.circular(15)),
          width: 400,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: 20,
            ),
            Image.network(
              this.widget.image,
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  this.widget.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      child: FloatingActionButton(
                        onPressed: decrease,
                        child: Icon(
                          Icons.remove,
                          size: 25,
                        ),
                      ),
                    ),
                    Text(this.widget.quantity.toString()),
                    Container(
                      height: 30,
                      child: FloatingActionButton(
                        onPressed: increase,
                        child: Icon(
                          Icons.add,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 120, 0, 0),
                  child: Text(
                    "₹" + this.widget.price,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
