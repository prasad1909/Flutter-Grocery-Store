import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductCard extends StatelessWidget {
  final title;
  final price;
  final image;
  final color;

  ProductCard(this.title, this.price, this.image, this.color);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var cart;

  Future<void> addToCart(nameItem, price, quantity) async {
    SharedPreferences preferences = await _prefs;
    await preferences.setStringList(nameItem, [price, quantity]);
    cart = await preferences.getKeys();
    for (var item in cart) {
      print(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200.0,
          width: 350.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: this.color,
              border: Border.all(width: 1)),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Image.network(
                this.image,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 5,
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    this.title,
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "₹" + this.price.toString(),
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await addToCart(
                              this.title, this.price.toString(), "1");
                        },
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
