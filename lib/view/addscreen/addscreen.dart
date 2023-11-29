import 'package:blood_donation/controller/donor_provider.dart';
import 'package:blood_donation/helpers/colors.dart';
import 'package:blood_donation/view/addscreen/widgets/dropdown_widget.dart';
import 'package:blood_donation/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final donorProvider = Provider.of<DonorProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 236, 236),
      appBar: AppBar(
        title: const Text(
          'Add Donors',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: appcolor,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  NameTextField(donorNameController: donorProvider.donorName),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PhoneNumberField(
                  donorPhoneController: donorProvider.donorPhone),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: DropDown(donorProvider: donorProvider),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: CupertinoButton(
                  onPressed: () {
                    donorProvider.addDonor();

                    donorProvider.donorName.clear();
                    donorProvider.donorPhone.clear();

                    Navigator.pop(context);
                  },
                  color: appcolor,
                  padding: const EdgeInsets.all(10),
                  disabledColor: Colors.grey,
                  child: const Text("Submit",style: TextStyle(fontWeight: FontWeight.bold),),
                )),
          ],
        ),
      ),
    );
  }
}
