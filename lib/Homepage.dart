import 'package:flutter/material.dart';
import 'SignInPage.dart';
import 'SignUpPage.dart';
import 'VolunteerPage.dart';

class MyHomePage extends StatelessWidget {
  final String? title;

  const MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Home'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18), // Increase font size
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), // Adjust padding
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18), // Increase font size
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Set button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), // Adjust padding
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VolunteerListPage()),
                  );
                },
                child: Text(
                  'Volunteer List',
                  style: TextStyle(fontSize: 18), // Increase font size
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Set button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), // Adjust padding
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
