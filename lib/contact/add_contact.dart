import 'package:contacts2/contact/home_screen.dart';
import 'package:contacts2/model/cont_model.dart';
import 'package:flutter/material.dart';

class Add_Contact extends StatefulWidget {
  const Add_Contact({Key? key}) : super(key: key);

  @override
  State<Add_Contact> createState() => _Add_ContactState();
}
TextEditingController txtName=TextEditingController();
TextEditingController txtContact=TextEditingController();
class _Add_ContactState extends State<Add_Contact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Add Contact"),
            centerTitle: true,
            backgroundColor: Colors.cyan.shade50,
            elevation: 5,
          ),
          body: Column(
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/user.png"),radius: 70),
              SizedBox(height: 20),
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.purple.shade50,width: 2)
                  ),
                  label: Text("Name"),
                  hintText: "Name",
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.purple.shade400,width: 1)),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: txtContact,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.purple.shade50,width: 2)
                  ),
                  label: Text("Contact No"),
                  hintText: "Number",
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.purple.shade400,width: 1)),
                ),
              ),
              ElevatedButton(onPressed: () {
                String name=txtName.text;
                String contect=txtContact.text;
                String images="assets/man1.png";
                contModel contactmodel=contModel(name: name,mobile: contect,image: images);
                contactList.add(contactmodel);
                Navigator.pop(context);
              }, child: Text("Submit"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade200)),

            ],
          ),
        )
    );
  }
}
