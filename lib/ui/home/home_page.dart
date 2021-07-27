import 'package:flutter/material.dart';
import 'package:mforms/ui/form/form_page.dart';
import 'package:mforms/ui/group/group_page.dart';
import 'package:mforms/ui/ui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<String> _titles = ['Grub', 'Form', 'Profil'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _getWidgets() {
    return [
      GroupPage(),
      FormPage(),
      ProfilePage(),
    ];
  }

  List<Widget> _getAppbarAction(int index) {
    if (index == 0) {
      return [
        IconButton(
          icon: Icon(Icons.group_add_outlined),
          tooltip: 'Tambah Grub',
          onPressed: () {},
        ),
      ];
    } else
      return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        // actions: _getAppbarAction(_selectedIndex),
      ),
      body: _getWidgets()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Group'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Form'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'User'),
        ],
      ),
    );
  }
}
