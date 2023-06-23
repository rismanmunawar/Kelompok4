import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Attraction Booking',
    theme: ThemeData(primarySwatch: Colors.green),
    home: Dashboard(),
  ));
}

class Attraction {
  final String imgPath;
  final String name;
  final String desc;
  final double price;
  final String location;
  final int rating;
  final String announcement1;
  final String announcement2;

  Attraction({
    required this.imgPath,
    required this.name,
    required this.desc,
    required this.price,
    required this.location,
    required this.rating,
    required this.announcement1,
    required this.announcement2,
  });
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int? selectedAttractionIndex;
  double selectedDuration = 1;
  DateTime selectedDate = DateTime.now();
  double totalCost = 0;

  int notificationCount = 1; // Jumlah notifikasi

  final List<Attraction> attractionsList = [
    Attraction(
      imgPath: 'assets/images/img3.jpg',
      name: 'Alhelwah',
      desc: 'All-Inclusive Resort',
      location: 'Jl. Sukalaya II, No. 45',
      rating: 3,
      price: 80.0,
      announcement1: 'Attraction Announcement 1',
      // Added announcement
      announcement2: 'Attraction Announcement 2', // Added announcement
    ),
    Attraction(
      imgPath: 'assets/images/img1.jpg',
      name: 'Siliwangi Pusat Center',
      desc: 'All-Inclusive Resort',
      price: 90.0,
      rating: 4,
      location: 'Jl. Letnan Harun, No. 48',
      announcement1: 'Attraction Announcement 1',
      // Added announcement
      announcement2: 'Attraction Announcement 2', // Added announcement
    ),
    Attraction(
      imgPath: 'assets/images/img4.jpg',
      name: 'Kaiku',
      desc: 'All-Inclusive Resort',
      location: 'Jl. Ir. H Juanda No. KM 2',
      rating: 5,
      price: 100.0,
      announcement1: 'Attraction Announcement 1',
      // Added announcement
      announcement2: 'Attraction Announcement 2', // Added announcement
    ),
    Attraction(
      imgPath: 'assets/images/img2.jpg',
      name: 'Indo Soccer',
      desc: 'All-Inclusive Resort',
      price: 150.0,
      rating: 5,
      location: 'Jl. Letnan Harun No. 86',
      announcement1: 'Attraction Announcement 1',
      // Added announcement
      announcement2: 'Attraction Announcement 2', // Added announcement
    ),
  ];

  List<Attraction> filteredAttractions = [];

  @override
  void initState() {
    super.initState();
    filteredAttractions = attractionsList;
  }

  void searchAttractions(String query) {
    setState(() {
      filteredAttractions = attractionsList
          .where((attraction) =>
          attraction.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                  onChanged: (query) {
                    searchAttractions(query);
                  },
                ),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: filteredAttractions.length,
                  itemBuilder: (context, index) {
                    Attraction attr = filteredAttractions[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(attraction: attr),
                          ),
                        );
                      },
                      child: AttractionCard(attraction: attr),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AttractionCard extends StatelessWidget {
  final Attraction? attraction;

  AttractionCard({this.attraction});

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
            color: Colors.black.withOpacity(0.1),
          ),
        ],
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
                        image: NetworkImage(attraction!.imgPath),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                            Text(
                              attraction!.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.pin_drop,
                                  color: Colors.grey.withOpacity(0.7),
                                  size: 12,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  attraction!.location,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            RatingWidget(rating: attraction!.rating),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\Rp${attraction!.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Per Hours',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.green.withOpacity(0.5),
                        offset: Offset.zero,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 15,
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

class RatingWidget extends StatelessWidget {
  final int? rating;

  RatingWidget({this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < rating! ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            );
          }),
        ),
        const SizedBox(width: 5),
        Text(
          '${rating!}/5 Reviews',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  final Attraction? attraction;

  DetailPage({this.attraction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        title: Text(attraction!.name),
      ),
      backgroundColor: Colors.green,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          attraction!.imgPath,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        attraction!.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        attraction!.desc,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Location: ${attraction!.location}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
                      RatingWidget(rating: attraction!.rating),
                      const SizedBox(height: 16.0),
                      Text(
                        'Price: \Rp${attraction!.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Announcement 1:',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              attraction!.announcement1,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Announcement 2:',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              attraction!.announcement2,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation!'),
                        content: Text('Would you like to make a booking?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Yes'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Pesan'),
                                    content: Text(
                                        'Successfully Booked. Please Make Payment!'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Book Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
