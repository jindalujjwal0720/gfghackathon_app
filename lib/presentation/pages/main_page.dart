import 'package:flutter/material.dart';
import 'package:gfghackathon_app/presentation/pages/appointments_page.dart';
import 'package:gfghackathon_app/presentation/pages/chats_page.dart';
import 'package:gfghackathon_app/presentation/pages/doctor_profile_page.dart';
import 'package:gfghackathon_app/presentation/pages/homepage.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const AppointmentsPage(),
    // Don't un-comment it, Actual firebase is connected, it will Cost READS
    // Only un-comment if it is very much required
    // const ChatsPage(),
    const HomePage(),
    const HomePage(),
  ];

  void _onTapItem(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.calendar_month_rounded)
                : const Icon(Icons.calendar_month_outlined),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(Icons.chat)
                : const Icon(Icons.chat_outlined),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
        selectedItemColor: const Color.fromARGB(255, 64, 91, 200),
        unselectedItemColor: AppColors.grey,
      ),
    );
  }
}
