import 'package:flutter/material.dart';

Widget buttonNavi(String page){
  return  Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, -3),
            color: Colors.black.withOpacity(0.90),
            blurRadius: 10)
      ],
        color: Color(0xC9FFFFFF),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavIcon(icondata: Icons.home_outlined, active: page=="home"),
          buildNavIcon(icondata: Icons.search, active: page=="search"),
          buildNavIcon(icondata: Icons.shopping_bag_sharp, active: page=="cart"),
          buildNavIcon(icondata: Icons.person, active:page=="person"),
        ],
      ),

    ),

  );
}

Widget buildNavIcon({required IconData icondata, required bool active}) {
  return Icon(
      icondata, size: 30, color: Color(active ? 0xFF0B3CF3 : 0xFF0A1034));
}