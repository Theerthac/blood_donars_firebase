// import 'package:blood_donation/controller/connectivity_provider.dart';
// import 'package:blood_donation/controller/donor_provider.dart';
// import 'package:blood_donation/model/donors_model.dart';
// import 'package:blood_donation/helpers/colors.dart';
// import 'package:blood_donation/view/addscreen/addscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//      final provider= Provider.of<DonorProvider>(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: const Center(
//               child: Text(
//             'Blood Donation',
//             style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//           )),
//           backgroundColor: appcolor,
//         ),
//         floatingActionButton: floatingActionButton(context),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         body: Consumer<DonorProvider>(builder: (context, provider, child) {
//           if (provider.donors.isEmpty) {
//             Provider.of<InternetConnectivityProvider>(context, listen: false)
//                 .getInternetConnectivity(context);
//             provider.fetchDonors();
//             return const Center(
//                 child: Text(
//               'Empty',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30),
//             ));
//           }

//           return ListView.builder(
//             itemCount: provider.donors.length,
//             itemBuilder: (context, index) {
//               final DonorsModel donor = provider.donors[index];
//               return Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   height: size.height * 0.1,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                       boxShadow: const [
//                         BoxShadow(
//                             color: Color.fromARGB(255, 220, 219, 219),
//                             blurRadius: 5,
//                             spreadRadius: 15)
//                       ]),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CircleAvatar(
//                           backgroundColor: appcolor,
//                           radius: 30,
//                           child: Text(
//                             donor.group.toString(),
//                             style: const TextStyle(fontSize: 25),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             donor.name.toString(),
//                             style: const TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             donor.phone.toString(),
//                             style: const TextStyle(fontSize: 18),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/update',
//                                   arguments: {
//                                     'name': donor.name,
//                                     'phone': donor.phone.toString(),
//                                     'group': donor.group,
//                                     'id': donor.id,
//                                   });
//                             },
//                             icon: const Icon(Icons.edit),
//                             iconSize: 30,
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               provider.deleteDonor(donor.id.toString());
//                             },
//                             icon: const Icon(Icons.delete),
//                             iconSize: 30,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }));
//   }

//   FloatingActionButton floatingActionButton(BuildContext context) {
//     final donorProvider = Provider.of<DonorProvider>(context);
//     return FloatingActionButton(
//       onPressed: () {

//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => AddScreen(),
//         ));

//         // Navigator.pushNamed(context, '/AddScreen');
//         // donorProvider.donorName.clear();
//         //     donorProvider.donorPhone.clear();
//       },
//       backgroundColor: appcolor,
//       shape: const CircleBorder(),
//       child: const Icon(
//         Icons.add,
//         size: 40,
//         color: Colors.white,
//       ),
//     );
//   }
// }

import 'package:blood_donation/controller/connectivity_provider.dart';
import 'package:blood_donation/controller/donor_provider.dart';
import 'package:blood_donation/helpers/colors.dart';
import 'package:blood_donation/model/donors_model.dart';
import 'package:blood_donation/view/addscreen/addscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DonorProvider>(context);
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
            provider.donorName.clear();
            provider.donorPhone.clear();

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
        body: Consumer<DonorProvider>(builder: (context, donors, child) {
          if (provider.donors.isEmpty) {
            Provider.of<InternetConnectivityProvider>(context, listen: false)
                .getInternetConnectivity(context);
            provider.fetchDonors();
            return const Center(
                child: Text(
              'Empty',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ));
          }
          return ListView.builder(
            itemCount: provider.donors.length,
            itemBuilder: (context, index) {
              final DonorsModel donor = provider.donors[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
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
                        child: CircleAvatar(
                          backgroundColor: appcolor,
                          radius: 30,
                          child: Text(
                            donor.group.toString(),
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            donor.name.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            donor.phone.toString(),
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/update',
                                  arguments: {
                                    'name': donor.name,
                                    'phone': donor.phone.toString(),
                                    'group': donor.group,
                                    'id': donor.id,
                                  });
                            },
                            icon: const Icon(Icons.edit),
                            iconSize: 30,
                          ),
                          IconButton(
                            onPressed: () {
                              provider.deleteDonor(donor.id.toString());
                              //Navigator.pop(context);
                            },
                            icon: const Icon(Icons.delete),
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
        }));
  }
}
