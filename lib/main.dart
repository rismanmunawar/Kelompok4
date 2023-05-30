import 'dart:js';

import 'package:flutter/material.dart';

const Color mainThemeColor = Color(0xFF75A341);

final List<Attraction> attractionsList = [
  Attraction(
      imgPath:
      'assets/images/img3.jpg',
      name: 'Alhelwah',
      desc: 'All-Inclusive Resort',
      location: 'Jl. Sukalaya II, No. 45',
      rating: 3,
      price: 80.0),
  Attraction(
      imgPath:
      'assets/images/img1.jpg',
      name: 'Siliwangi Pusat Center',
      desc: 'All-Inclusive Resort',
      price: 90.0,
      rating: 4,
      location: 'Jl. Letnan Harun, No. 48'),
  Attraction(
      imgPath:
      'assets/images/img4.jpg',
      name: 'Kaiku',
      desc: 'All-Inclusive Resort',
      location: 'Jl. Ir. H Juanda No. KM 2',
      rating: 5,
      price: 100.0),
  Attraction(
      imgPath:
      'assets/images/img2.jpg',
      name: 'Indo Soccer',
      desc: 'All-Inclusive Resort',
      price: 150.0,
      rating: 5,
      location: 'Jl. Letnan Harun No. 86'),
];

final List<BottomBarItem> barItemsList =  [

  BottomBarItem(label: 'Home', isSelected: true, icon: Icons.home),
  BottomBarItem(label: 'Search', isSelected: true, icon: Icons.search),
  BottomBarItem(label: 'Bookings', isSelected: false, icon: Icons.pending_actions),
  BottomBarItem(label: 'Payments', isSelected: false, icon: Icons.payments),
  BottomBarItem(label: 'Account', isSelected: false, icon: Icons.person),
];

void main() {
  runApp(
      const MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: LoginPage(),
        home: SplashPage(),
          // home: LandingPage()
      )
  );
}


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});


  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LandingPage())
      );
    });

    return Stack(
      children: [
        Container(
            color: mainThemeColor
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/football.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 8),
              const Text(
                'Football App',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            ],
          ),
        ),


        Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.4)
                )
            )
        )
      ],
    );
  }
}

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          title:Center(
            child:Image.asset(
              'assets/images/football.png', // Ganti dengan path gambar Anda
              width: 35, // Sesuaikan ukuran gambar
              height: 35,
              color: Colors.white, // Jika Anda ingin menerapkan warna pada gambar
            ),
          ),
        ),
        backgroundColor: mainThemeColor,
        body: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50)
            ),
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/login.png'), // Ganti dengan path gambar yang sesuai
                  fit: BoxFit.cover,
                ),
                color: Colors.black.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: const Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                 radius: 25,
                 backgroundColor: Colors.white,
                 child: Icon(
                   Icons.person,
                   size: 50,
                   color: Colors.white,
                 ),
                )
              )
            )
        )
    );

  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/images/football.png', // Replace with the actual image path
              width: 80,
              height: 80,
              color: mainThemeColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/search.png',),
                        fit: BoxFit.cover,
                      alignment: Alignment.center,
                    )
                )
            ),
            Container(color: mainThemeColor.withOpacity(0.7)),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Football App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      )
                  ),
                  const SizedBox(height: 60),
                  Image.asset(
                    'assets/images/football.png', // Replace with the actual image path
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  Text('Choose location to'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withOpacity(0.5))
                  ),
                 const SizedBox(height: 10),
                 const Text('Find a Field', textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )
                  ),
                 const SizedBox(height: 20),
                  LandingSearchBar()
                ]
            ),
          ],
        )
    );
  }
}

class LandingSearchBar extends StatelessWidget {
  const LandingSearchBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text('Search field', style: TextStyle(color: Colors.grey)),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListPage()));
                  },
                  child: Container(
                      width: 30, height: 30,
                      child: Icon(Icons.search,color: Colors.white, size: 15),
                      decoration: BoxDecoration(
                          color: mainThemeColor,
                          borderRadius: BorderRadius.circular(25)
                      )
                  )
              )

            ]
        )
    );
  }
}

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0,
            title:Center(
              child:Image.asset(
                'assets/images/football.png', // Ganti dengan path gambar Anda
                width: 35, // Sesuaikan ukuran gambar
                height: 35,
                color: Colors.white, // Jika Anda ingin menerapkan warna pada gambar
              ),
            ),

            actions: [
              Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: const Icon(
                      Icons.notifications,
                      color: Colors.white
                  )
              )
            ]
        ),
        backgroundColor: mainThemeColor,
        body: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50)
            ),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)
                    )
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: attractionsList.length,
                              itemBuilder: (context, index) {
                                Attraction attr = attractionsList[index];

                                return AttractionCard(attraction: attr);
                              })
                      ),
                      BottomBarWidget()
                    ]
                )
            )
        )
    );
  }
}

class AttractionCard extends StatelessWidget {

  Attraction? attraction;
  AttractionCard({ this.attraction });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  offset: Offset.zero,
                  color: Colors.black.withOpacity(0.1)
              )
            ]
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(attraction!.imgPath!),
                                    fit: BoxFit.cover
                                )
                            )
                        ),
                        Container(
                            height: 150,
                            padding: const EdgeInsets.all(20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(attraction!.name!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize:14,
                                                fontWeight:FontWeight.bold
                                            )
                                        ),
                                        const SizedBox(width: 5),
                                        Row(
                                            children: [
                                              Icon(
                                                  Icons.pin_drop,
                                                  color: Colors.grey.withOpacity(0.7),
                                                  size: 12
                                              ),
                                              const SizedBox(width: 5),
                                              Text(attraction!.location!,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey.withOpacity(0.7),
                                                      fontWeight: FontWeight.bold
                                                  )
                                              ),
                                            ]
                                        ),
                                        const SizedBox(width: 5),
                                        RatingWidget(rating: attraction!.rating!)
                                      ]
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('\Rp${attraction!.price!.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize:16,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      const SizedBox(height: 5),
                                      Text('Per Hours',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.withOpacity(0.7),
                                              fontWeight: FontWeight.bold
                                          )
                                      )
                                    ],
                                  )
                                ]
                            )
                        )
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: mainThemeColor,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: mainThemeColor.withOpacity(0.5),
                                      offset:Offset.zero
                                  )
                                ]
                            ),
                            child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 15
                            )
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  BottomBarWidgetState createState() => BottomBarWidgetState();
}

class BottomBarWidgetState extends State<BottomBarWidget> {

  List<BottomBarItem> barItems = barItemsList;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            //... rest of the code omitted for brevity ...
            children: List.generate(
                barItems.length,
                    (index) {

                  var barItem = barItems[index];

                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          barItems.forEach((element) {
                            element.isSelected = barItem == element;
                          });
                        });
                      },
                      child: Column(
                          children: [
                            Icon(barItem.icon, color: barItem.isSelected!
                                ? mainThemeColor : Colors.grey),
                            Text(barItem.label!, style: TextStyle(
                                color: (barItem.isSelected! ? mainThemeColor : Colors.grey),
                                fontSize: 11
                            ))
                          ]
                      )
                  );
                })



        )
    );
  }
}

class RatingWidget extends StatelessWidget {

  int? rating;
  RatingWidget({super.key,  this.rating });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
            children: List.generate(5, (index) {
              return Icon(
                  index < rating! ? Icons.star : Icons.star_border,
                  color: Colors.yellow
              );
            })
        ),
        const SizedBox(width: 5),
        Text('${rating!}/5 Reviews',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey.withOpacity(0.7)
            )
        )
      ],
    );
  }
}

class Attraction {
  String? imgPath;
  String? name;
  String? desc;
  double? price;
  String? location;
  int? rating;

  Attraction({this.imgPath, this.name, this.desc, this.price, this.location, this.rating });
}
class BottomBarItem {
  String? label;
  bool? isSelected;
  IconData? icon;

  BottomBarItem({ this.label, this.isSelected, this.icon });
}

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();
}