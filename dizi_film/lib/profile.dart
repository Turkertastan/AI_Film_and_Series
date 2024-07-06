import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/ucuncu.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.yellow.shade400, width: 4),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/ikon_dizi.jpg"),
                  radius: 70,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              itemProfile("Name", "Türker Tastan", Icons.person, () {
                // Profil kısmına tıklanınca yapılacak işlemleri ekleyin
              }),
              const SizedBox(
                height: 30,
              ),
              itemProfile("Movies Like You", "....", Icons.movie, () {
                // Profil kısmına tıklanınca yapılacak işlemleri ekleyin
              }),
              const SizedBox(
                height: 20,
              ),
              itemProfile("Log out", "See You", Icons.logout, () {
                // Çıkış yapma işlemlerini ekleyin
              }),
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Siyah arka plan
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.yellow.shade400),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.yellow.shade400.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white), // Beyaz renk
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(color: Colors.white), // Beyaz renk
          ),
          leading: Icon(
            iconData,
            color: Colors.white, // Beyaz renk
          ),
          trailing: const Icon(Icons.arrow_forward, color: Colors.white), // Beyaz renk
        ),
      ),
    );
  }
}
