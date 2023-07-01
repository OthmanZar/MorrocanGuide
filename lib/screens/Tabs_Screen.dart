import 'package:flutter/material.dart';
import 'package:moroccan_guide/screens/Favorite_Scren.dart';
import 'package:moroccan_guide/screens/category_screen.dart';
import 'package:moroccan_guide/widgets/Drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _SelectItems(int index) {
    setState(() {
      _nbr = index;
    });
  }

  int _nbr = 0;

  final List<Widget> _Items = [
    CategoryScreen(),
    FavoriteScren(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Moroccan Guide'),
        ),
        drawer: DrawerC(),
        body: _Items[_nbr],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _SelectItems,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            currentIndex: _nbr,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.zoom_out_map_sharp), label: 'Dashborad'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.g_mobiledata), label: 'Favourite'),
            ]));
  }
}
