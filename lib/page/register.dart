import 'package:flutter/material.dart';
import 'login.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}
void navigateToLogin(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const Login()),
  );
}

class _RegisterState extends State<Register> {
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
      backgroundColor: Colors.green,
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
                          navigateToLogin(context);
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
