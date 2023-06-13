import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedBank = '';
  String inputNama = '';
  String inputKodeVA = '';
  bool showAddVA = false;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  List<Map<String, String>> banks = [
    {'name': 'Bank A', 'image': 'assets/images/bank_a.png'},
    {'name': 'Bank B', 'image': 'assets/images/bank_b.png'},
    {'name': 'Bank C', 'image': 'assets/images/bank_c.png'},
    {'name': 'Bank D', 'image': 'assets/images/bank_d.png'},
    {'name': 'Bank E', 'image': 'assets/images/bank_e.png'},
    {'name': 'Bank F', 'image': 'assets/images/bank_f.png'},
  ];

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
                  'Pilih Bank / Virtual Account:',
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
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((pickedDate) {
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Tanggal Main',
                    border: OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  controller: selectedDate != null
                      ? TextEditingController(
                    text: DateFormat('dd/MM/yyyy').format(selectedDate!),
                  )
                      : null,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((pickedTime) {
                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                        });
                      }
                    });
                  },
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Jam Main',
                      border: OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.access_time),
                    ),
                    controller: selectedTime != null
                        ? TextEditingController(
                      text: selectedTime!.format(context),
                    )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (inputNama.isEmpty || selectedBank.isEmpty || selectedDate == null || selectedTime == null) {
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
                            title: const Text('Konfirmasi Pembayaran'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Nama Pemesan: $inputNama'),
                                const SizedBox(height: 10),
                                Text('Metode Pembayaran: $selectedBank'),
                                const SizedBox(height: 10),
                                Text('Nomor Pembayaran: ${Random().nextInt(999999)}'),
                                const SizedBox(height: 10),
                                Text('Tanggal Main: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}'),
                                const SizedBox(height: 10),
                                Text('Jam Main: ${selectedTime!.format(context)}'),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  // Lakukan logika penyimpanan atau proses pembayaran di sini
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.green,
                    side: const BorderSide(width: 2, color: Colors.green),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.green),
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
