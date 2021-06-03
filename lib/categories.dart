
import 'package:e_alisveris/category.dart';
import 'package:e_alisveris/components/buttonNavi.dart';
import 'package:e_alisveris/components/header.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "Hepsi",
    "Bilgisayarlar",
    "Telefonlar",
    "Küçük Eşyalar",
    "Hopörlör",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                header("Kategoriler ", context),
                SizedBox(height: 16),
              Expanded(
               child: ListView(
                children: categories
                    .map((String title) => buildCategory(title,context))
                    .toList()),
          ),
        ]),
      ),
              buttonNavi("search"),
    ])));
  }
}

Widget buildCategory(String title,context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
         CategoryPage(title),
      ));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4)),
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF1133FD)),
      ),
    ),
  );
}
