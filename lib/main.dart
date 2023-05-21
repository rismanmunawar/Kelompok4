import 'package:flutter/material.dart';

const Color mainThemeColor = Color(0xFF75A341);

final List<Attraction> attractionsList = [
  Attraction(
      imgPath:
      'assets/images/img1.png',
      name: 'Alhelwah',
      desc: 'All-Inclusive Resort',
      location: 'Jl. Sukalaya II, No. 45',
      rating: 4,
      price: 80.0),
  Attraction(
      imgPath:
      'assets/images/img2.png',
      name: 'Siliwangi Pusat Center',
      desc: 'All-Inclusive Resort',
      price: 90.0,
      rating: 4,
      location: 'Jl. Letnan Harun, No. 48'),
  Attraction(
      imgPath:
      'https://cf.bstatic.com/xdata/images/hotel/max1024x768/256931299.jpg?k=57b5fb9732cd89f308def5386e221c46e52f48579345325714a310addf819274&o=&hp=1',
      name: 'Impressive Punta Cana',
      desc: 'All-Inclusive Resort',
      price: 100.0,
      rating: 5,
      location: 'Punta Cana, DR'),
  Attraction(
      imgPath:
      'https://cf.bstatic.com/xdata/images/hotel/max1024x768/283750757.jpg?k=4f3437bf1e1b077463c9900e4dd015633db1d96da38f034f4b70a4ba3ef76d82&o=&hp=1',
      name: 'Villas Mar Azul Dreams',
      desc: 'All-Inclusive Resort',
      price: 100.0,
      rating: 4,
      location: 'Tallaboa, PR'),
];
final List<BottomBarItem> barItemsList = [
  BottomBarItem(label: 'Home', isSelected: true, icon: Icons.home),
  BottomBarItem(label: 'Account', isSelected: false, icon: Icons.person),
  BottomBarItem(label: 'Bookings', isSelected: false, icon: Icons.pending_actions),
  BottomBarItem(label: 'Payments', isSelected: false, icon: Icons.payments),
  BottomBarItem(label: 'Search', isSelected: false, icon: Icons.search),
];

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage()
          //home: LandingPage()
      )
  );
}


class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ListPage())
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
class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.all(20),
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://images.pexels.com/photos/261394/pexels-photo-261394.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                        fit: BoxFit.cover
                    )
                )
            ),
            Container(color: mainThemeColor.withOpacity(0.7)),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Football App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      )
                  ),
                  SizedBox(height: 60),
                  Image.asset(
                    'assets/images/football.png', // Replace with the actual image path
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(height: 10),
                  Text('Choose location to'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withOpacity(0.5))
                  ),
                  SizedBox(height: 5),
                  Text('Find a Field', textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(height: 20),
                  LandingSearchBar()
                ]
            ),
          ],
        )
    );
  }
}

class LandingSearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search field', style: TextStyle(color: Colors.grey)),
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
                width: 24, // Sesuaikan ukuran gambar
                height: 24,
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
                                      Text('\$${attraction!.price!.toStringAsFixed(2)}',
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
  @override
  BottomBarWidgetState createState() => BottomBarWidgetState();
}

class BottomBarWidgetState extends State<BottomBarWidget> {

  List<BottomBarItem> barItems = barItemsList;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
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
  RatingWidget({ this.rating });

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