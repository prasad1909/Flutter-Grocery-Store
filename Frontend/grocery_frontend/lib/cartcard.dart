import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {

  final title;
  final image;
  final price;

  CartCard (
      this.title,
      this.image,
      this.price,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Row(
        children: [
        SizedBox(
        width: 20,
      ),
       Image.network(
        this.image,
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 5,
      ),
       ]
    )
    );

  }
}
