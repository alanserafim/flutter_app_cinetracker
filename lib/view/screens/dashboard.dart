import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Filmes"),
            BottomNavigationBarItem(icon: Icon(Icons.today), label: "Lançamentos"),
          ]
      ),
    );
  }
}
