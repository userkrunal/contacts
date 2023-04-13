//import 'package:contacts2/contact/add_contact.dart';
import 'package:contacts2/model/cont_model.dart';
import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';
//import 'package:url_launcher/url_launcher.dart';
contModel contmodel=contModel();
List contactList=[
  contModel(name: "Darshan sakhat",mobile: "9904177670",image: "assets/d1.jpeg",time: "2:30"),
  contModel(name: "Prince",mobile: "7069121351",image: "assets/img1.png",time: "3:30"),
  contModel(name: "Yash Vasoya",mobile: "3049785620",image: "assets/fish.jpg",time: "1:50"),
  contModel(name: "Bhargav",mobile: "9586968168",image: "assets/img2.png",time: "6:10"),
  contModel(name: "Vivek",mobile: "9106619178",image: "assets/flo.jpg",time: "4:40"),
  contModel(name: "Dixit ",mobile: "9512889686",image: "assets/u2.png",time: "3:50"),
  contModel(name: "Kushik",mobile: "4960748392",image: "assets/u2.png",time: "4:20"),
  contModel(name: "Himalay",mobile: "5966948192",image: "assets/man.png",time: "12:20"),
  contModel(name: "Kishan",mobile: "3452168796",image: "assets/u2.png",time: "11:20"),
];

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
    State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  TextEditingController txtName=TextEditingController();
  TextEditingController txtContact=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scrollbar(
          child: Scaffold(
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: Container(
                    height: double.infinity,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan.shade100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200,left: 8,right: 8),
                  child: ListView.builder(itemBuilder: (context, index) => myWidget(contactList[index],index),itemCount: contactList.length),
                ),
                Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200
                            ),child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                              children: [
                                Container(height: 35,width: 100,child: Center(child: Text("All",style: TextStyle(fontSize: 20,color: Colors.blue.shade700,fontFamily: 'Alkatra'))),decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.white)),
                                SizedBox(width: 10),
                                Text("Missed",style: TextStyle(fontSize: 20,color: Colors.blue.shade700)),
                              ],
                          ),
                            ),
                          )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 30),
                        Text("Recents",style: TextStyle(fontSize: 30,color: Colors.blue.shade900)),
                        SizedBox(width: 190),
                        Icon(Icons.edit_square,size: 30,color: Colors.blue.shade900),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.search,color: Colors.grey.shade300),
                            SizedBox(width: 10),
                            Text("Search",style: TextStyle(fontSize: 20,color: Colors.grey.shade300)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
           floatingActionButton: FloatingActionButton(
             onPressed: () {
              Navigator.pushNamed(context, 'add').then((value) {
                setState(() {
                });
              },);
             },child: Icon(Icons.add),
           ),
          ),
        ),
    );
  }
  Widget myWidget(contModel cm,index)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,top: 8),
      child: Container(
        height: 70,
        width: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
        child: ListTile(title: Text("${cm.name}",style: TextStyle(fontSize: 20,color: Colors.blue.shade700),),
          subtitle: Text("${cm.mobile}"),
          leading:CircleAvatar(backgroundImage: AssetImage("${cm.image}"),radius: 40),
          trailing: Text("${cm.time}"),
          onTap: () {
            Navigator.pushNamed(context, 'ui',arguments: index).then((value) {
              setState(() {
              });
            },);
          },
        ),
      ),
    );
  }
}
