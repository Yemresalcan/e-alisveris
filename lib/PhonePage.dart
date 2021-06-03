import 'package:flutter/material.dart';

import 'components/buttonNavi.dart';
import 'components/header.dart';


class PhonePage extends StatelessWidget {

  String phonepage;

  PhonePage(this.phonepage);
  List<Map> products = [
    {
      "isim": "Samsung",
      "fotograf": "assets/images/Smartphone.png",
      "fiyat": "1000"
    },
    {
      "isim": "Mac book ",
      "fotograf": "assets/images/Surface laptop.png",
      "fiyat": "10,000"
    },
    {
      "isim": "'24' Monitör",
      "fotograf": "assets/images/Surface laptop.png",
      "fiyat": "1699"
    },
    {
      "isim": "Sorunsuz PC ",
      "fotograf": "assets/images/lenovo.png",
      "fiyat": "500"
    },
    {
      "isim": "PixelBook",
      "fotograf": "assets/images/Pixelbook.png",
      "fiyat": "2000"
    },
    {
      "isim": "Monster ",
      "fotograf": "assets/images/Lg gram.png",
      "fiyat": "10000"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(phonepage,context),
                      SizedBox(height: 32),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                          children: products.map((Map product) {
                            return buildContent(
                                product["isim"], product["fotograf"], product["fiyat"]);
                          }).toList(),
                        ),
                      )
                    ],
                  )),

              //ALT MENÜ

              buttonNavi("search"),
            ])));
  }
}
Widget buildContent( String photourl, String price,context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PhonePage("Telefonlar");
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent..withOpacity(0.08),
              blurRadius: 24.0,
              offset: Offset(0, 16),
            )
          ]),
      child: Column(
        children: [
          SizedBox(height: 16),
          Image.asset(photourl),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Telefonlar",
                  style: TextStyle(
                      color: Color(0xFF0A1034),
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              Text(" $price TL",
                  style: TextStyle(
                      color: Color(0xFF0001FC),
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ],
          )
        ],
      ),
    ),
  );
}