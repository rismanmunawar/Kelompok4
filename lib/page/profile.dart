import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
                          backgroundColor: Colors.green,side: BorderSide.none, shape: const StadiumBorder()),
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
            )
        )
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
          color: Colors.green, // Atur warna ikon menjadi biru
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
          color: Colors.green, // Atur warna ikon menjadi biru
        ),
      ) : null,
    );

  }
}
