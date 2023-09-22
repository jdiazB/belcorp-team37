import 'package:flutter/material.dart';
import 'package:untitled9_belcorp/apis/apiservice.dart';
import 'package:untitled9_belcorp/cloud/cloudservice.dart';
import 'package:untitled9_belcorp/pages/calenderpage.dart';
import 'package:untitled9_belcorp/pages/chat.dart';
import 'package:untitled9_belcorp/pages/favoritepage.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}




class _InitPageState extends State<InitPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ChatPage(),
    FavoritePage(),
    CalenderPage(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onButtonPressed() {
    // TODO: Hacer algo cuando se presiona el botón
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Belcorp App conection'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Belcorp'),
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                // TODO: Navegar a la pantalla de perfil
              },
            ),
            ListTile(
              title: Text('Pedidos'),
              onTap: () {
                // TODO: Navegar a la pantalla de pedidos
              },
            ),
            ListTile(
              title: Text('Ajustes'),
              onTap: () {
                // TODO: Navegar a la pantalla de ajustes
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => ARPage()),
      //     );
      //   },
      //   child: Icon(Icons.camera_alt),
      //   backgroundColor: Colors.pink,
      // ),

      bottomNavigationBar: Stack(

        children:[BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Calender',
            ),


          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.pink,
          onTap: _onItemTapped,
        ),
        ],

      ),
      bottomSheet: FloatingActionButton(
        onPressed: _onButtonPressed,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,

      ),

    );;
  }
}



