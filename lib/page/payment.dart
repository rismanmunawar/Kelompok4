import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Attraction {
  final String imgPath;
  final String name;
  final String desc;
  final double price;
  final String location;
  final int rating;

  Attraction({
    required this.imgPath,
    required this.name,
    required this.desc,
    required this.price,
    required this.location,
    required this.rating,
  });
}

class Payment extends StatelessWidget {
  final List<Attraction> attractionsList = [
    Attraction(
      imgPath: 'assets/images/img3.jpg',
      name: 'Alhelwah',
      desc: 'All-Inclusive Resort',
      location: 'Jl. Sukalaya II, No. 45',
      rating: 3,
      price: 80.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menyembunyikan tombol "Back"
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
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
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
          child: ListView.builder(
            itemCount: attractionsList.length,
            itemBuilder: (context, index) {
              Attraction attr = attractionsList[index];
              return AttractionCard(attraction: attr);
            },
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
          child: Column(
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
                padding: const EdgeInsets.all(20),
                child: Column(
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
                    const SizedBox(height: 5),
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
                    const SizedBox(height: 5),
                    RatingWidget(rating: attraction!.rating),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\Rp${attraction!.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentNow()),
                            );
                          },
                          child: const Text('Pay Now'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class PaymentNow extends StatefulWidget {
  @override
  _PaymentNowState createState() => _PaymentNowState();
}

class _PaymentNowState extends State<PaymentNow> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  String selectedBank = '';
  String inputNama = '';
  String inputKodeVA = '';
  bool showAddVA = false;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  List<Map<String, String>> banks = [
    {'name': 'BCA', 'image': 'assets/images/bca.png'},
    {'name': 'BRI', 'image': 'assets/images/brimo.png'},
    {'name': 'Dana', 'image': 'assets/images/dana.png'},
    {'name': 'Gopay', 'image': 'assets/images/gopay.png'},
    {'name': 'Flip', 'image': 'assets/images/flip.png'},
    {'name': 'OVO', 'image': 'assets/images/ovo.png'},
  ];

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.green),
        elevation: 0,
        title: Center(
          child: Image.asset(
            'assets/images/football.png',
            width: 35,
            height: 35,
            color: Colors.white,
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Pilih Bank / Metode Pembayaran:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: banks.length,
                    itemBuilder: (BuildContext context, int index) {
                      final bank = banks[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Update the selected bank
                            selectedBank = bank['name']!;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectedBank == bank['name'] ? Colors.green : Colors.grey,
                              width: selectedBank == bank['name'] ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                bank['image']!,
                                width: 50,
                                height: 50,
                                color: selectedBank == bank['name'] ? Colors.green : null,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                bank['name']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedBank == bank['name'] ? Colors.green : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Toggle the visibility of the "Add Virtual Account" section
                      showAddVA = !showAddVA;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.green,
                    side: const BorderSide(width: 2, color: Colors.green),
                  ),
                  child: const Text(
                    'Add Virtual Account',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                if (showAddVA) ...[
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Nama Virtual Account',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        inputNama = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Nomor/Kode Virtual Account',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        inputKodeVA = value;
                      });
                    },
                  ),
                ],
                const SizedBox(height: 20),
                TextField(
                  readOnly: true,
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Tanggal Main',
                    border: OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  controller: dateController,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                        timeController.text = selectedTime!.format(context);
                      });
                    }
                  },
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Jam Main',
                      border: OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.access_time),
                    ),
                    controller: timeController,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (inputNama.isEmpty ||
                        selectedBank.isEmpty ||
                        selectedDate == null ||
                        selectedTime == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Harap isi semua field yang diperlukan!'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Sukses'),
                            content: Text(
                              'Pembayaran berhasil! \n\nDetail Pembayaran:\nNama Virtual Account: $inputNama\nKode Virtual Account: $inputKodeVA\nBank: $selectedBank\nTanggal Main: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}\nJam Main: ${selectedTime!.format(context)}',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: const Text('Bayar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






