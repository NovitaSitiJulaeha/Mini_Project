import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wedplan/views/checklist/checklist_screen.dart';
import 'package:wedplan/views/guest/guest_screen.dart';
import 'package:wedplan/views/home/home_screen.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _bottomNavCurrentIndex = 0;
  final List<Widget> _menu = [
    const Home(),
    const Checklist(),
    const GuestScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menu[_bottomNavCurrentIndex],
      bottomNavigationBar: Container(
        color: const Color(0xFF17203A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: GNav(
            backgroundColor: const Color(0xFF17203A),
            tabBackgroundColor: Colors.white,
            color: Colors.white,
            activeColor: Colors.blue,
            gap: 10,
            padding: const EdgeInsets.all(10),
            onTabChange: (index) {
              setState(() {
                _bottomNavCurrentIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.list_alt_rounded,
                text: 'Checklist',
              ),
              GButton(
                icon: Icons.people_outline,
                text: 'Guest',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
