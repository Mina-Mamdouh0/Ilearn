import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/Screens/student/borrow_books_screen.dart';
import 'package:i_learn/Screens/student/chat_bot_screen.dart';
import 'package:i_learn/Screens/student/roles_screen.dart';
import 'package:i_learn/Screens/profile_screen.dart';
import 'package:i_learn/Screens/auth/selectloginscreen.dart';
import 'package:i_learn/Screens/student/semester_student_screen.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/services/shared_pref_services.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {


@override
  void initState() {
    BlocProvider.of<AppCubit>(context).getProfileStudent();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: const Text(
          'Student',
          style: TextStyle(
              fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black54),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const ProfileUserScreen()));
                    },
                    child: Container(
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                              height: 150, width: 150, 'Image/user.png'),
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
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const SemesterStudentScreen()));
                    },
                    child: Container(
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15)
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
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const ChatBotScreen();
                      }));
                    },
                    child: Container(
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                              height: 150, width: 150, 'Image/cha.png'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Chat Bot',
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
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const BorrowBooksScreen()));
                    },
                    child: Container(
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                              height: 150, width: 150, 'Image/bo.png'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Online Books',
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
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const RolesScreen()));
                    },
                    child: Container(
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                              height: 150, width: 150, 'Image/meeting.png'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'roles',
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
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      SharedPref.removeDate(key: 'kLogin');
                      SharedPref.removeDate(key: 'kAccountStudent');
                      SharedPref.removeDate(key: 'kIdAccount');
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SelectLoginScreen()),(route) => false,);
                    },
                    child: Container(
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15)
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
                )
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: (){
              },
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Image.asset(
                        height: 150, width: 150, 'Image/meeting.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Generate Schedule',
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
    );
  }
}
