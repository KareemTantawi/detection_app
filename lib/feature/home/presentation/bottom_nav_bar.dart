import 'package:detecition_app/core/styles/colors/app_color.dart';
import 'package:detecition_app/feature/capture/presentation/capture_screen.dart';
import 'package:detecition_app/feature/history/presentation/history_screen.dart';
import 'package:detecition_app/feature/home/presentation/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  // List of pages to navigate between
  final List<Widget> _pages = [
    const UploadScreen(),
    const CaptureScreen(),
    const HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 72.h,
          width: double.infinity,
          decoration: BoxDecoration(
              // color: Colors.orange,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  // color: AppColors.primaryColor.withOpacity(0.4),
                  color: Colors.pink.withOpacity(0.2),
                  spreadRadius: 40,
                  blurRadius: 30,
                  offset: const Offset(4, 12),
                ),
              ]
              // border: Border.all(
              //   width: 1,
              //   color: Colors.grey.withOpacity(0.3),
              // ),
              ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: _selectedIndex,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.image,
                    size: 26.sp,
                  ),
                  label: 'Upload',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                  ),
                  label: 'Capture',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                  ),
                  label: 'History',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
