import 'package:category_widget/category.dart';
import 'package:flutter/material.dart';

// TODO: Pass this information into your custom [Category] widget
const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit converter',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          child: Category(name: _categoryName, color: _categoryColor, icon: _categoryIcon),
        ),
      ),
    );
  }
}