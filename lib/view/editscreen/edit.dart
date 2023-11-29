import 'package:blood_donation/constant/blood_groups.dart';
import 'package:blood_donation/controller/donor_provider.dart';
import 'package:blood_donation/helpers/colors.dart';
import 'package:blood_donation/view/editscreen/widgets/dropdown_widget.dart';
import 'package:blood_donation/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDonor extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  EditDonor({super.key});

  @override
  Widget build(BuildContext context) {
    final donorProvider = Provider.of<DonorProvider>(context);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    donorProvider.donorName.text = args['name'];
    donorProvider.donorPhone.text = args['phone'];
    donorProvider.selectedgroups = args['group'];
    final docId = args['id'];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 236, 236),
        appBar: AppBar(
          title: const Text(
            'Update Donors',
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
                child: EditDropDown(
                    donorProvider: donorProvider, bloodgroups: bloodgroups),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CupertinoButton(
                    onPressed: () {
                      donorProvider.donorName;
                      donorProvider.donorPhone;
                      donorProvider.updateDonor(docId);
                      Navigator.pop(context);
                    },
                    color: appcolor,
                    padding: const EdgeInsets.all(10),
                    disabledColor: Colors.grey,
                    child: const Text(
                      "Update",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
