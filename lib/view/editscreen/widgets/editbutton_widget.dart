// import 'package:blood_donation/controller/donor_provider.dart';
// import 'package:blood_donation/helpers/colors.dart';
// import 'package:flutter/material.dart';

// class EditButtonWidget extends StatefulWidget {
//   const EditButtonWidget(
//       {super.key,
//       required this.formkey,
//       required this.donorProvider,
//       this.docId});

//   final GlobalKey<FormState> formkey;
//   final DonorProvider donorProvider;
//   final docId;

//   @override
//   State<EditButtonWidget> createState() => _EditButtonWidgetState();
// }

// class _EditButtonWidgetState extends State<EditButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
      
//       onPressed: () {

//         if (widget.formkey.currentState!.validate()) {
//           Navigator.pop(context);
//           widget.donorProvider.updateDonor(widget.docId);
//         }
//       },
//       style: ButtonStyle(
//           minimumSize:
//               MaterialStateProperty.all(const Size(double.infinity, 50)),
//           backgroundColor: MaterialStateProperty.all(appcolor)),
//       child: const Text(
//         'Update',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
