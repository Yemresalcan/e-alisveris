import 'package:e_alisveris/category.dart';
import 'package:e_alisveris/components/label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;
  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7922),
    Color(0xFFF5D8C0),
  ];

  List<int> capascites = [64, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            header(widget.productTitle, context),
            SizedBox(height: 32),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    label("Yeni"),
                    SizedBox(height: 25),

                    //ÜrünFotografi
                    Center(child: Image.asset("assets/images/Product.png")),
                    SizedBox(height: 30),
                    //Renk Seçme
                    Text(
                      "Renkler",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A1034),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: colors
                          .map((Color color) => colorOption(color))
                          .toList(),
                    ),

                    //Kapasite Seçenekleri
                    SizedBox(height: 32),
                    Text(
                      "Kapasite",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A1034),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(children: [
                      Text(
                        "64GB",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1034),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "126GB",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1034),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "512 GB",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1034),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ),

                SizedBox(width: 10),

            //Sepete ekle Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.blue),
              child: Text("Sepete Ekle ",textAlign: TextAlign.center,style:TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,

              )),
            ),
                SizedBox(height: 15),
          ]))
    ])));
  }
}

Widget colorOption(Color color) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: Color(0xFF0001FC), width: 2)),
      width: 23,
      height: 23,
    ),
  );
}
