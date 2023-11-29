import 'package:blood_donation/constant/blood_groups.dart';
import 'package:blood_donation/controller/donor_provider.dart';
import 'package:blood_donation/helpers/colors.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  const DropDown({super.key, required this.donorProvider});

  final DonorProvider donorProvider;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(color: Colors.white),
          hintText: 'Select Blood Group',
          hintStyle: const TextStyle(color: appcolor)),
      items: bloodgroups
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(30),
      onChanged: (value) {
        donorProvider.selectedgroups = value;
      },
      validator: (value) {
        if (value == null) {
          return "Select blood Group";
        } else {
          return null;
        }
      },
    );
  }
}
