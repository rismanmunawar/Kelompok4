import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, // Menyembunyikan tombol "Back"
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0,
            title:Center(
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
                      color: Colors.white
                  )
              )
            ]
        ),
        backgroundColor: Colors.green,
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
                      child: Center(
                        child: Text(
                          'Isi Search',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}
