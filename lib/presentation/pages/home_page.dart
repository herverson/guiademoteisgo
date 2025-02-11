import 'package:flutter/material.dart';
import '../components/custom_nav_bar.dart';
import 'motel_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: CustomNavBar(),
      ),
      body: const MotelPage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        onPressed: () {},
        label: const Row(
          children: [
            Icon(Icons.map),
            SizedBox(width: 5),
            Text(
              'mapa',
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
