import 'package:blood_donation/helpers/colors.dart';
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key, required this.donorNameController});

  final TextEditingController donorNameController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: donorNameController,
      decoration: InputDecoration(
        hintText: "Donor Name",
        hintStyle: const TextStyle(color: appcolor),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(
          color: Colors.white,
        ),
      
      ),
      
         validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter name ';
        } else {
          return null;
        }
      },
    );
  }
}


class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required this.donorPhoneController,
  });

  final TextEditingController donorPhoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: donorPhoneController,
      keyboardType: TextInputType.number,
      maxLength: 10,

      decoration: InputDecoration(
        hintText: "Phone Number",
        hintStyle:  const TextStyle(color: appcolor),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter number';
        } else if (value.length != 10) {
          return 'Enter correct number';
        } else {
          return null;
        }
      },
    );
  }
}
