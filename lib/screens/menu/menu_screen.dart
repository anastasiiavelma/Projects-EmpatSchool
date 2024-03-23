import 'package:flutter/material.dart';
import 'package:tasks/screens/home/main_screen.dart';
import 'package:tasks/utils/constants.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Tween<Offset> _tween;

  final List<Widget> _screens = [
    const MainScreen(),
    const MainScreen(),
    const MainScreen(),
    const MainScreen(),
    const MainScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _tween = Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SlideTransition(
        position: _animationController.drive(_tween),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kPrimaryColor,
          selectedItemColor: kBackgroundColor,
          unselectedItemColor: itemColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _animationController.forward(from: 0.0);
            });
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ),
              label: 'Fav',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ),
              label: 'Me',
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
