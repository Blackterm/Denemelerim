import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class deneme6 extends StatefulWidget {
  const deneme6({Key? key}) : super(key: key);

  @override
  State<deneme6> createState() => _deneme6State();
}

class _deneme6State extends State<deneme6> {
  int _selectedIndex = 0;

  final List<Color> _colors = [Colors.white, Colors.red, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Transition Example'),
      ),
      body: PageTransitionSwitcher(
        // reverse: true, // uncomment to see transition in reverse
        transitionBuilder: (
          Widget child,
          Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: Container(
            key: ValueKey<int>(_selectedIndex),
            color: _colors[_selectedIndex],
            child: Center(
              child: FlutterLogo(size: 300),
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
