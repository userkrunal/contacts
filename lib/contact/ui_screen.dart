import 'package:contacts2/contact/home_screen.dart';
import 'package:contacts2/model/cont_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact_UI extends StatefulWidget {
  const Contact_UI({Key? key}) : super(key: key);

  @override
  State<Contact_UI> createState() => _Contact_UIState();
}


class _Contact_UIState extends State<Contact_UI> {
  TextEditingController txtName=TextEditingController();
  TextEditingController txtContact=TextEditingController();
  contModel cm=contModel();
  @override
  Widget build(BuildContext context) {
  int i=ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
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
              Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios_new,color: Colors.blue.shade500),
                          Text("Contacts",style: TextStyle(fontSize: 30,color: Colors.blue.shade500),),
                          Icon(Icons.edit_square,size: 30,color: Colors.blue.shade500),
                        ],
                      ),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${contactList[i].name}",style: TextStyle(fontSize: 30,color: Colors.blue.shade500)),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("${contactList[i].mobile}",style: TextStyle(fontSize: 15,color: Colors.blue.shade500)),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                IconButton(onPressed: () {
                                  setState(() {
                                    contactList.removeAt(i);
                                    Navigator.pop(context);
                                  });
                                }, icon: Icon(Icons.delete,color: Colors.blue.shade500,size: 30,)),
                              IconButton(onPressed: () {
                                txtName=TextEditingController(text: cm.name);
                                txtContact=TextEditingController(text: cm.mobile);
                                       updetDialog(i);
                              }, icon: Icon(Icons.edit,color: Colors.blue.shade500,size: 30)),
                              IconButton(onPressed: () async {
                                String link="tel:${contactList[i].mobile}";
                                await launchUrl(Uri.parse(link));
                              }, icon: Icon(Icons.call,color: Colors.blue.shade500,size: 30)),
                              IconButton(onPressed: ()  {
                                Share.share("${contactList[i].name}");
                              }, icon: Icon(Icons.share,color: Colors.blue.shade500,size: 30)),
                              IconButton(onPressed: ()  async {
                                String link="sms:${contactList[i].mobile}?body=Thank You";
                                      await launchUrl(Uri.parse(link));
                              }, icon: Icon(Icons.message,color: Colors.blue.shade500,size: 30)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 490,right: 20,left: 20),
                child: Container(
                  height: 150,
                  width: 340,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Send Whatsapp Messages",style: TextStyle(color: Colors.blue.shade500,fontSize: 25)),
                      SizedBox(height: 5),
                      Divider(height: 2,color: Colors.blue),
                      Text("Share Contact",style: TextStyle(color: Colors.blue.shade500,fontSize: 25)),
                      SizedBox(height: 5),
                      Divider(height: 2,color: Colors.blue),
                      Text("Add to Favourites",style: TextStyle(color: Colors.blue.shade500,fontSize: 25)),
                      SizedBox(height: 5),
                      Divider(height: 2,color: Colors.blue),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundImage: AssetImage("${contactList[i].image}"),radius: 70),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
  void updetDialog(int i)
  {
    showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: txtName,decoration: InputDecoration(
                labelText: "${contactList[i].name}",
              ),),
              TextField(controller: txtContact,decoration: InputDecoration(
                labelText: "${contactList[i].mobile}",
              ),),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                String newName=txtName.text;
                String newContact=txtContact.text;
                setState(() {
                  contactList[i]=contModel(name: newName,mobile: newContact);
                });
                Navigator.pop(context);
              }, child: Text("Update"))
            ],
          ),
        );
      },);
  }
}
