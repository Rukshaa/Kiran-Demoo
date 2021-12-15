import 'package:flutter/material.dart';
import 'posts.dart';
import 'home.dart';
import 'about_us.dart';
import 'my_drawer_header.dart';
import 'contact_us.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages(),
    );
  }
}

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = HomePage();
    } else if (currentPage == DrawerSections.posts) {
      container = PostsPage();
    } else if (currentPage == DrawerSections.about_us) {
      container = AboutUsPage();
    } else if (currentPage == DrawerSections.contact_us) {
      container = ContactUsPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[800],
        title: Text("Kiran Demo"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home_outlined,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "Posts", Icons.event,
              currentPage == DrawerSections.posts ? true : false),
          menuItem(3, "About Us", Icons.contacts,
              currentPage == DrawerSections.about_us ? true : false),
          menuItem(4, "Contact Us", Icons.phone,
              currentPage == DrawerSections.contact_us? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.posts;
            } else if (id == 3) {
              currentPage = DrawerSections.about_us;
            } else if (id == 4) {
              currentPage = DrawerSections.contact_us;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  home,
  posts,
  about_us,
  contact_us,
}
