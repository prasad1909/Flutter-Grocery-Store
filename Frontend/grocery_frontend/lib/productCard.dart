import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final title;
  final price;
  final image;
  final color;

  ProductCard(this.title, this.price, this.image, this.color);

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
              ClipRRect(
                child: Image.network(
                  this.image,
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 5,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    this.title,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "₹ " + this.price.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
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
