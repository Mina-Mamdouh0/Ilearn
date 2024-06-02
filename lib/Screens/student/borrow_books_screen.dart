
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BorrowBooksScreen extends StatelessWidget {
  const BorrowBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: const Text(
          'Borrow Books',
          style: TextStyle(
              fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black54),
        ),
        leading: IconButton(
            iconSize: 30, onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Datastructure'),
              selected: true,
              tileColor: Colors.grey,
              trailing: IconButton(
                  onPressed: () async{
                    try{
                      await launch('https://mrcet.com/downloads/digital_notes/CSE/II%20Year/DATA%20STRUCTURES%20DIGITAL%20NOTES.pdf');
                    }catch(e){
                      debugPrint(e.toString());
                    }
                  },
                  icon: const Icon(Icons.link)),
              leading: Icon(Icons.my_library_books),
            ),

            ListTile(
              title: Text('Algorithms'),
              selected: true,
              tileColor: Colors.grey,
              trailing: IconButton(
                  onPressed: () async{
                    try{
                      await launch('https://courses.minia.edu.eg/Attach/16036flowchart-algorithm-manual.pdf');
                    }catch(e){
                      debugPrint(e.toString());
                    }
                  },
                  icon: const Icon(Icons.link)),
              leading: Icon(Icons.my_library_books),
            ),

            ListTile(
              title: Text('Databse'),
              selected: true,
              tileColor: Colors.grey,
              trailing: IconButton(
                  onPressed: () async{
                    try{
                      await launch('https://www.bu.edu/tech/files/2018/06/intro2DB20180611.pdf');
                    }catch(e){
                      debugPrint(e.toString());
                    }
                  },
                  icon: const Icon(Icons.link)),
              leading: Icon(Icons.my_library_books),
            ),
          ],
        ),
      ),
    );
  }
}
