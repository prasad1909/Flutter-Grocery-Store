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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.deepOrange, width: 4),
          borderRadius: BorderRadius.circular(15)
        ),
        width: 400,
        child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
          width: 20,
        ),
         Image.network(
          this.image,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 5,
        ),
            SizedBox(width: 15,),
            Column(
              children: [
                SizedBox(height: 20,),
                Text(this.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Container(
                     height: 30,
                      child: FloatingActionButton(onPressed: (){},
                        child: Icon(Icons.remove, size: 25,),),
                  ),

                    Text("1"),

                    Container(
                      height: 30,
                      child: FloatingActionButton(onPressed: (){},
                        child: Icon(Icons.add, size: 25,),),
                    ),
                  ],
                ),

              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 120, 0, 0),
                  child: Text("₹"+ this.price, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
         ]
      )
      ),
    );

  }
}
