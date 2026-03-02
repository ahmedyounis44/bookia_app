import 'package:bookia_application/core/theme/app_colors.dart';
import 'package:bookia_application/features/home/cubit/home_cubit.dart';
import 'package:bookia_application/features/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => HomeCubit()..getHomeSliders(),
      child: const Home(),
    ),
    //const BookMarkScreen(),
   // const CartScreen(),
   // const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black87,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Home.svg"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Shop.svg"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Profile.svg"),
            label: '',
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
