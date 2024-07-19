import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/ahadeeth.dart';
import 'package:islami_app/home/tabs/quran.dart';
import 'package:islami_app/home/tabs/radio.dart';
import 'package:islami_app/home/tabs/sebha.dart';
import 'package:islami_app/home/tabs/settings.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg3.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'إسلامي',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                fontFamily: 'el-mesirri',
              ),
            ),
            centerTitle: true,
          ),
          body: tabs[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/radio.png')),
                label: '',
                backgroundColor: Color(0xFFB7935F),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                label: '',
                backgroundColor: Color(0xFFB7935F),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/images/quran-quran-svgrepo-com.png')),
                label: '',
                backgroundColor: Color(0xFFB7935F),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/quran.png')),
                label: '',
                backgroundColor: Color(0xFFB7935F),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
                backgroundColor: Color(0xFFB7935F),
              ),
            ],
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ],
    );
  }

  List<Widget> tabs = [
     RadioTab(),
     SebhaTab(),
     AhadeethTab(),
     QuranTab(),
     SettingsTab(),
  ];
}
