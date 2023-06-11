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
        // home: SplashPage(),
        //   home: RegisterPage()
          home: ProfilePage()
      )
  );
}


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LandingPage())
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

  void navigateToRegisterPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

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
              width: 40, // Sesuaikan ukuran gambar
              height: 40,
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
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 61,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Welcome to Football App',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Please Login',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Icon(
                              Icons.email,
                              color: Color(0xFF75A341),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Icon(
                              Icons.lock,
                              color: Color(0xFF75A341),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika untuk melakukan login
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF75A341),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()), // Untuk mengisi ruang di antara tombol Login dan teks "Don't have an Account?"
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          const Text(
                            "Don't have an Account?",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Logika untuk pindah ke halaman registrasi
                              navigateToRegisterPage(context);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  void navigateToLoginPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: Center(
          child: Image.asset(
            'assets/images/football.png',
            width: 35,
            height: 35,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: mainThemeColor,
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/login.png'),
              fit: BoxFit.cover,
            ),
            color: Colors.black.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 61,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Icon(
                          Icons.email,
                          color: Color(0xFF75A341),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Icon(
                          Icons.lock,
                          color: Color(0xFF75A341),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Icon(
                          Icons.lock,
                          color: Color(0xFF75A341),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Logika untuk melakukan registrasi
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF75A341),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Register',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()), // Untuk mengisi ruang di antara tombol Register dan teks "Already have an Account?"
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      const Text(
                        "Already have an Account?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Logika untuk pindah ke halaman login
                          navigateToLoginPage(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

class ProfilePage extends StatelessWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF75A341),
          iconTheme: const IconThemeData(color: Colors.black),
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

          ]
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(image: AssetImage('assets/images/user.png')),
                ),
              ),
              const SizedBox(height: 10),
              Text("Coding Tech"),
              Text("superadmin@gmail.com"),
              const SizedBox(height: 15),
              SizedBox(
                  width: 150,
                  height: 35,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Edit Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,side: BorderSide.none, shape: const StadiumBorder()),
                  ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 30),

            //  Menu
              ProfileMenuWidget(title: "Account", icon: Icons.account_circle, onPress: () {}),
              ProfileMenuWidget(title: "History", icon: Icons.history, onPress: () {}),
              ProfileMenuWidget(title: "Delete Account", icon: Icons.no_accounts_rounded, onPress: () {}),
              ProfileMenuWidget(title: "Setting", icon: Icons.settings, onPress: () {}),
              const Divider(),
              ProfileMenuWidget(title: "Logout", icon: Icons.logout, onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
  Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textcolor,
  }):super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFF75A341).withOpacity(0.10),
        ),
        child: Icon(icon, // Menggunakan ikon "cog" (roda gigi)
          size: 18, // Atur ukuran ikon menjadi 30
          color: Colors.blue, // Atur warna ikon menjadi biru
        ),
      ),

      title: Text(title,  style: Theme.of(context).textTheme.bodyText1),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(
          Icons.arrow_forward, // Menggunakan ikon "cog" (roda gigi)
          size: 18, // Atur ukuran ikon menjadi 30
          color: Colors.blue, // Atur warna ikon menjadi biru
        ),
      ) : null,
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