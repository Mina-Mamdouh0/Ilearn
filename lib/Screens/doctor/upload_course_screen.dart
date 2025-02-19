

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';

class UploadCourseScreen extends StatefulWidget {
  final String idSemester;
  const UploadCourseScreen({Key? key, required this.idSemester}) : super(key: key);

  @override
  State<UploadCourseScreen> createState() => _UploadCourseScreenState();
}

class _UploadCourseScreenState extends State<UploadCourseScreen> {

  TextEditingController uploadName=TextEditingController();

  GlobalKey<FormState> kForm =GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Upload Course',
            style: TextStyle(
                fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black54),
          ),
          backgroundColor: Colors.grey[700],
          leading: IconButton(
            iconSize: 30,
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocConsumer<AppCubit,AppState>(
          builder: (context,state){
            var cubit=AppCubit.get(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: kForm,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      style: const TextStyle(color: Colors.blueAccent),
                      controller: uploadName,
                      decoration: InputDecoration(
                        labelText: 'Upload Name',
                        hintText: 'Upload Name',
                        hintStyle: const TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.white,
                                blurRadius: 40,
                                offset: Offset(4, 7)),
                            Shadow(
                                color: Colors.blueAccent,
                                blurRadius: 40,
                                offset: Offset(-4, -7)),
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        labelStyle: const TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.white,
                                blurRadius: 40,
                                offset: Offset(4, 7)),
                            Shadow(
                                color: Colors.blueAccent,
                                blurRadius: 40,
                                offset: Offset(-4, -7)),
                          ],
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter data";
                        }
                      },
                    ),
                    const SizedBox(height: 20,),

                    (state is LoadingUploadCourseState)?
                    const CircularProgressIndicator()
                        :ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          backgroundColor: Colors.blueAccent,
                          shadowColor: Colors.black),
                      onPressed: (){
                        if(kForm.currentState!.validate()){
                          cubit.uploadCourse(
                              courseName: uploadName.text,
                              semesterId: widget.idSemester
                          );
                        }
                      },
                      child: const Text(
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'BebasNeue',
                              color: Colors.black),
                          'Upload'),
                    ),


                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
          listener: (context,state){
            if(state is SuccessUploadCourseState){
              Navigator.pop(context);
            }else if (state is ErrorUploadCourseState){
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('${'Error Upload'}')));
            }

          },
        )
    );
  }
}
