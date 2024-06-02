import 'package:flutter/material.dart';
import 'package:i_learn/Screens/profile_screen.dart';
import 'package:i_learn/Screens/auth/selectloginscreen.dart';
import 'package:i_learn/Screens/doctor/level.dart';

import '../../services/shared_pref_services.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: const Text(
          'Doctor',
          style: TextStyle(
              fontSize: 30, fontFamily: 'BebasNeue', color: Colors.black54),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUserScreen()),);
                },
                child: Container(
                  height: 220,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          blurRadius: 20,
                          offset: const Offset(4, 7)),
                      BoxShadow(
                          color: Colors.grey.shade600,
                          blurRadius: 20,
                          offset: const Offset(-4, -7)),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Image.asset(height: 150, width: 150, 'Image/user.png'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const LevelScreen()));
                },
                child: Container(
                  height: 220,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          blurRadius: 20,
                          offset: const Offset(4, 7)),
                      BoxShadow(
                          color: Colors.grey.shade600,
                          blurRadius: 20,
                          offset: const Offset(-4, -7)),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Image.asset(
                          height: 150, width: 150, 'Image/workshop.png'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Courses',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: (){
                  SharedPref.removeDate(key: 'kLogin');
                  SharedPref.removeDate(key: 'kAccountStudent');
                  SharedPref.removeDate(key: 'kIdAccount');
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SelectLoginScreen()),(route) => false,);
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          blurRadius: 20,
                          offset: const Offset(4, 7)),
                      BoxShadow(
                          color: Colors.grey.shade600,
                          blurRadius: 20,
                          offset: const Offset(-4, -7)),
                    ],
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 5),
                      Icon(Icons.logout,size: 100),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
