import 'package:contacts2/contact/home_screen.dart';
import 'package:contacts2/model/cont_model.dart';
import 'package:flutter/material.dart';

class Fav_Screen extends StatefulWidget {
  const Fav_Screen({Key? key}) : super(key: key);

  @override
  State<Fav_Screen> createState() => _Fav_ScreenState();
}

class _Fav_ScreenState extends State<Fav_Screen> {
  contModel contactModel =contModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Favourite Contacts",style: TextStyle(fontSize: 30,color: Colors.blue.shade500),),centerTitle: true,backgroundColor: Colors.cyan.shade100,),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
              width: 390,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.cyan.shade50),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text("Contacts",style: TextStyle(fontSize: 30,color: Colors.blue.shade500)),
                    ),
                  ],),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Container(height: 40,width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                      child: Row(children: [SizedBox(width: 10),Icon(Icons.search,color: Colors.grey.shade300,size: 20),SizedBox(width: 10,),Text("Search...",style: TextStyle(color: Colors.grey.shade300,fontSize: 20),)],),

                    ),
                  ],),
                  SizedBox(height: 10),
                  Expanded(child: ListView.builder(itemBuilder: (context, index) => tile(contModel()),itemCount: contactList.length))
                ],
              ),
            ),
          ),
        ),
    );
  }
  Widget tile(contModel cm)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
        child: ListTile(
          title: Text("${cm.name}"),
          trailing: Icon(Icons.star,color: Colors.blue.shade500),
        ),
      ),
    );
  }
}
