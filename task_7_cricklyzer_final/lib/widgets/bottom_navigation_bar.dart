import 'package:flutter/material.dart';
import 'package:cricklyzer/Screens/learning_hub.dart';
import 'package:cricklyzer/Screens/home_screen.dart';
import 'package:cricklyzer/Screens/cric_score.dart';
import 'package:cricklyzer/Screens/statistics_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  const CustomBottomNavigationBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Color(0xffffffff),
      elevation: 0,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home, color: Colors.red,),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.speed, color: Colors.red),
          label: 'CricScore',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart,color: Colors.red),
          label: 'Stats',
        ),
        NavigationDestination(
          icon: Icon(Icons.sports_cricket,color: Colors.red),
          label: 'Learn Hub'
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CricScore()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StatisticsScreen()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LearningHub()),
            );
            break;
        }
      },
      
    );
  }
}