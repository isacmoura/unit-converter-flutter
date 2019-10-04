import 'package:flutter/material.dart';

import 'category.dart';

final _backgroundColor = Colors.green[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    var portrait = MediaQuery.of(context).orientation == Orientation.portrait;

    Widget _buildCategoryWidgets(List<Widget> categories) {
      if(portrait) {
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => categories[index],
            itemCount: categories.length,
        );
      } else {
        return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 3.0,
            children: categories,
        );
      }
    }

    final categories = <Category>[];

    for(var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        icon: Icons.cake,
      ));
    }

    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title:
        Text('Unit Converter',
          style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
          ),
        ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add item',
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.update),
              title: Text('Update')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.error),
              title: Text('Report')
          ),
        ],
      ),
    );
  }
}