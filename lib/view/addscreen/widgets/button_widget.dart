// import 'package:blood_donation/controller/donor_provider.dart';
// import 'package:blood_donation/helpers/colors.dart';
// import 'package:flutter/material.dart';

// class SubmitButton extends StatelessWidget {
//   const SubmitButton(
//       {super.key, required this.formkey, required this.donorProvider});

//   final GlobalKey<FormState> formkey;
//   final DonorProvider donorProvider;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
    
//       onPressed: () {
//          if (formkey.currentState!.validate()) {
//             donorProvider.addDonor();
//             donorProvider.donorName.clear();
//             donorProvider.donorPhone.clear();
//             Navigator.pop(context);
//           }
//       },
//       style: ButtonStyle(
//         minimumSize: MaterialStateProperty.all(const Size(double.infinity,50)),
//         backgroundColor: MaterialStateProperty.all(appcolor)
//       ),
//       child: const Text(
//         'Submit',
//         style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }
