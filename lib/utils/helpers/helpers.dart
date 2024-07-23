import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//
class NxHelpers {
  NxHelpers._();

  static Color? getColor(String value) {
    final Map<String, Color> colorMap = {
      'red': Colors.red,
      'redAccent': Colors.redAccent,
      'green': Colors.green,
      'greenAccent': Colors.greenAccent,
      'blue': Colors.blue,
      'blueAccent': Colors.blueAccent,
      'yellow': Colors.yellow,
      'yellowAccent': Colors.yellowAccent,
      'orange': Colors.orange,
      'orangeAccent': Colors.orangeAccent,
      'purple': Colors.purple,
      'purpleAccent': Colors.purpleAccent,
      'black': Colors.black,
      'white': Colors.white,
      'grey': Colors.grey,
      'pink': Colors.pink,
      'pinkAccent': Colors.pinkAccent,
      'brown': Colors.brown,
      'cyan': Colors.cyan,
      'cyanAccent': Colors.cyanAccent,
      'indigo': Colors.indigo,
      'indigoAccent': Colors.indigoAccent,
      'lime': Colors.lime,
      'limeAccent': Colors.limeAccent,
      'teal': Colors.teal,
      'tealAccent': Colors.tealAccent,
      'amber': Colors.amber,
      'amberAccent': Colors.amberAccent,
      'deepOrange': Colors.deepOrange,
      'deepOrangeAccent': Colors.deepOrangeAccent,
      'deepPurple': Colors.deepPurple,
      'deepPurpleAccent': Colors.deepPurpleAccent,
      'lightBlue': Colors.lightBlue,
      'lightBlueAccent': Colors.lightBlueAccent,
      'lightGreen': Colors.lightGreen,
      'lightGreenAccent': Colors.lightGreenAccent,
      // Add more colors as needed
    };

    return colorMap[value.toLowerCase()];
  }
  
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert({required String title, required String message}){
    showDialog(context: Get.context!,
      builder: (BuildContext context){
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: ()=> Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      );
      }
    );
  }


  static void navigateToScreen(BuildContext context, {required Widget screen}){
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }


  static String truncateText(String text, int maxLength){
    if (text.length <= maxLength){
      return text;
    }else{
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = "dd MMM yyyy"}){
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize){
    final wrappedList = <Widget>[];
    for(var i = 0; i < widgets.length; i += rowSize){
     final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize) ;
    wrappedList .add(Row(children: rowChildren,));
    }
    return wrappedList;
  }
}
