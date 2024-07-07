import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/pages/subpages/subpages.dart';
import 'package:kue/styling.dart';
import './pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kue',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignupProcess(),
        '/signup_2': (context) => const SignupStep2(),
        '/signup_3': (context) => const SignupStep3(),
        '/signup_4': (context) => const SignupStep4(),
        '/signup_5': (context) => const SignupStep5(),
        '/signup_6': (context) => const SignupStep6(),
        '/signup_7': (context) => const SignupStep7(),
        '/home': (context) => const MyHomePage(),
        '/matches': (context) => const MatchesPage(),
        '/profile': (context) => const ProfilePage(),
        '/edit_profile': (context) => const EditProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/chat': (context) => const ChatPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Example boolean for indicating new matches
  bool hasNewMatches = true;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MatchesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: Image.asset('assets/logos/logo.png'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryDarkColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_carousel),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.favorite),
                if (hasNewMatches)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: error,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: primaryLightColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
