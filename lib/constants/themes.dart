import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

var darkGray = const Color(0xff023047);
var lightOrange = const Color(0xffFFB703);
var darkOrange = const Color(0xffFB8500);
var darkBlue = const Color(0xff006BA6);
var lightBlue = const Color(0xff0496FF);

final lightTheme = ThemeData(
  fontFamily: "Lato",
  buttonTheme: const ButtonThemeData(),
  useMaterial3: false,
  appBarTheme: AppBarTheme(
    backgroundColor: lightBlue,
  ),
  textTheme: const TextTheme(
    displaySmall: TextStyle(color: Colors.black),
  ),
  dataTableTheme: DataTableThemeData(
    headingTextStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headingRowColor: MaterialStateColor.resolveWith(
        (states) => Colors.black), // original bluegrey
  ),
  tabBarTheme: TabBarTheme(
    dividerColor: Colors.black,
    indicatorColor: Colors.black,
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey[700],
    labelStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);

final sideMenuStyle = SideMenuStyle(
  displayMode: SideMenuDisplayMode.auto,
  decoration: const BoxDecoration(),
  openSideMenuWidth: 200,
  compactSideMenuWidth: 40,
  hoverColor: Colors.blue[100],
  selectedColor: Colors.lightBlue,
  selectedIconColor: Colors.white,
  unselectedIconColor: Colors.black54,
  backgroundColor: Colors.white,
  selectedTitleTextStyle: const TextStyle(color: Colors.white),
  unselectedTitleTextStyle: const TextStyle(color: Colors.black54),
  iconSize: 20,
  itemBorderRadius: const BorderRadius.all(
    Radius.circular(5.0),
  ),
  showTooltip: true,
  itemHeight: 50.0,
  itemInnerSpacing: 12,
  itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0),
  toggleColor: Colors.black54,
);
