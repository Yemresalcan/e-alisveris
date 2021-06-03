import 'package:e_alisveris/categories.dart';
import 'package:e_alisveris/components/buttonNavi.dart';
import 'package:flutter/material.dart';

import 'components/label.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  buildBaslik(), buildBanner(),
                  //BUTTONLAR
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildButton(
                                text: "Kategoriler",
                                icon: Icons.menu,
                                widget: CategoriesPage(),
                                context:context,),
                            buildButton(
                                text: "Favoriler",
                                icon: Icons.star,
                                widget: null),
                            buildButton(
                                text: "Hediyeler",
                                icon: Icons.card_giftcard,
                                widget: null),
                            buildButton(
                                text: "En çok satanlar ",
                                icon: Icons.people,
                                widget: null),
                          ]),
                    ),
                  ),
                  SizedBox(height: 40),
                  //SALES Title
                  Text(
                    "Satılık Ürünler",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 17),

                  //SALES PRODUCTS

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        buildUrunlerA(
                          text: "Samsunung",
                          photoUrl: "assets/images/Smartphone.png",
                          discount: "-%50",
                          screenWidth: screenWidth,
                        ),
                        buildUrunlerA(
                          text: "Monitör",
                          photoUrl: "assets/images/Monitor picture.png",
                          discount: "-%30",
                          screenWidth: screenWidth,
                        ),

                      ]),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        buildUrunlerA(
                          text: "LG Eba Canavarı",
                          photoUrl: "assets/images/Lg gram.png",
                          discount: "-%80",
                          screenWidth: screenWidth,
                        ),
                        buildUrunlerA(
                          text: "Laptop Valo için",
                          photoUrl: "assets/images/Surface laptop.png",
                          discount: "-%90",
                          screenWidth: screenWidth,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),
            ),

            //---------ALT MENÜ--------
          buttonNavi("home"),
          ],
        ),
      ),
    );
  }


  Widget buildBaslik() {
    return // BAŞLIK
        Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text("Ana Sayfa",
          style: TextStyle(
              fontSize: 32,
              color: Color(0xFF0A1034),
              fontWeight: FontWeight.bold)),
    );
  }

  Widget buildBanner() {
    return
        //BANNER
        Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
              decoration: BoxDecoration(
                  color: Color(0xFF073BF6),
                  borderRadius: BorderRadius.circular(6)),

              //Preminum Ürun
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Harman Home Speaker",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text("100 ₺ ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Image.asset("assets/images/harman.png")
                  ],
                ),
              ),
            ));
  }

  Widget buildButton({
    required String text,
    required IconData icon,
    required widget,
    BuildContext? context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context!, MaterialPageRoute(builder: (context) {
          return widget;
        }));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF48FA28)),
              child: Icon(icon, color: Color(0xFF0001FC), size: 30),
            ),
          ),
          SizedBox(height: 0.5),
          Text(
            text,
            style: TextStyle(
                color: Color(0xFF2728EE),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget buildUrunlerA(
      {required String text,
      required String photoUrl,
      required String discount,
      required double screenWidth}) {
    return Container(
      width: (screenWidth - 60) * 0.5,
      padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         label(discount),
          SizedBox(height: 22),
          //Ürün Resimi(Ana Sayfa)
          Image.asset(photoUrl),
          SizedBox(height: 22),
          Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)))
        ],
      ),
    );
  }
}
