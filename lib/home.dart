import 'package:flutter/material.dart';
import 'page/dashboard.dart';
import 'page/search.dart';
import 'page/payment.dart';
import 'page/booking.dart';
import 'page/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    Search(),
    Payment(),
    Booking(),
    Profile()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Dashboard();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu,
                            color: currentTab == 0 ? Colors.green : Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: currentTab == 0 ? Colors.green : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Booking();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list,
                            color: currentTab == 1 ? Colors.green : Colors.grey,
                          ),
                          Text(
                            'Booking',
                            style: TextStyle(
                              color: currentTab == 1 ? Colors.green : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Search();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                              color: currentTab == 2 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Payment();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.payment,
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Payment',
                            style: TextStyle(
                              color: currentTab == 3 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Profile();
                          currentTab = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab == 4 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: currentTab == 4 ? Colors.blue : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
