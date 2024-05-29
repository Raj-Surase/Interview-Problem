import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'Screens/chatscreen.dart';
import 'Screens/homescreen.dart';
import 'Screens/profilescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: lightReddish,
        scaffoldBackgroundColor: offWhite,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Screen _currentScreen = Screen.home;

  final List<Widget> _screens = [
    ChatScreen(),
    HomeContentScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _getAppBarTitle(),
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: lightReddish,
          ),
        ),
        actions: [
          _currentScreen.index == 1
              ? IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                              "Hey! Welcome to our private social posts app."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Okay"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              : Container(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
        child: _screens[_currentScreen.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen.index,
        onTap: (index) {
          setState(() {
            _currentScreen = Screen.values[index];
          });
        },
        selectedItemColor: darkGrey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: lightReddish,
              size: 24,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: lightReddish,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: lightReddish,
              size: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  String _getAppBarTitle() {
    switch (_currentScreen) {
      case Screen.chat:
        return 'Enter a message';
      case Screen.home:
        return 'Explore reveals';
      case Screen.profile:
        return 'My Profile';
      default:
        return '';
    }
  }
}
