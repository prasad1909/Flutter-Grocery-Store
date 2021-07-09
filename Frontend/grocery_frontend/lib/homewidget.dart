import 'package:flutter/material.dart';
import 'fruits.dart';


class HomeWidget extends StatelessWidget {
final title;
final imagePath;
final apiPath;


HomeWidget(
    this.title,
    this.imagePath,
    this.apiPath,
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),

        GestureDetector(child: Stack(
          children: [
            Container(
              height: 200,
              width: 325,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(image: AssetImage(this.imagePath),
                      fit: BoxFit.fitHeight)),
            ),
            Container(
                height: 200,
                width: 325,
                child: Center( child: Text(this.title, style: TextStyle(backgroundColor: Colors.black, fontSize: 30, color: Colors.white))))
          ],),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Fruits(this.apiPath)),
              );
            }),
      ],
    );
  }
}


