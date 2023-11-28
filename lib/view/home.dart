import 'package:blood_donation/view/addscreen.dart';
import 'package:blood_donation/helpers/colors.dart';
import 'package:blood_donation/view/edit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  void deleteDonor(docId) {
    donor.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Blood Donation',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        backgroundColor: appcolor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddScreen(),
          ));
        },
        backgroundColor: appcolor,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: donor.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 220, 219, 219),
                              blurRadius: 5,
                              spreadRadius: 15)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: appcolor,
                              radius: 30,
                              child: Text(
                                donorsnap['group'],
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              donorsnap['name'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              donorsnap['phone'].toString(),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/update',
                                    arguments: {
                                      'name': donorsnap['name'],
                                      'phone': donorsnap['phone'].toString(),
                                      'group': donorsnap['group'],
                                      'id': donorsnap.id,
                                    });
                              },
                              icon: Icon(Icons.edit),
                              iconSize: 30,
                            ),
                            IconButton(
                              onPressed: () {
                                deleteDonor(donorsnap.id);
                              },
                              icon: Icon(Icons.delete),
                              iconSize: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
