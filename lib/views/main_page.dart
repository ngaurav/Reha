import 'package:flutter/material.dart';
import 'package:rehab/views/home_page.dart';
import 'package:rehab/views/practice_page.dart';
import 'package:rehab/views/profile_page.dart';
import 'package:rehab/views/rehab_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const RehabPage(),
    const PracticePage(),
    const ProfilePage(),
  ];
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex: currentindex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.airline_seat_recline_normal_rounded),
                label: 'Rehab'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_baseball_outlined,
              ),
              label: 'Practice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
