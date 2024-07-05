import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/address_provider.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/add_address_screen_input_fields.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipcodeController = TextEditingController();
  final valueListenable = ValueNotifier<String?>(null);

  final List<String> countries = [
    'United States',
    'Egypt',
    'UK',
    'UAE',
    'France',
    'KSA',
  ];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kColor.whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColor.textColor,
            )),
        elevation: 0,
        title: Text(
          'Adding Shipping Address',
          style: appStyle(
              fw: FontWeight.w600, size: 18.sp, color: kColor.textColor),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w, bottom: 16.w),
          child: Column(
            children: [
              SizedBox(height: 31.h),
              // input fields
              AddressInputFields(
                fullNameController: fullNameController,
                addressController: addressController,
                cityController: cityController,
                stateController: stateController,
                zipcodeController: zipcodeController,
                countries: countries,
                valueListenable: valueListenable,
              ),

              SizedBox(height: 10.h),
              //button
              SizedBox(
                width: 343.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      backgroundColor: kColor.redColor,
                      elevation: 0),
                  onPressed: () {
                    Provider.of<AddressProvider>(context, listen: false)
                        .addAddress({
                      "fullName": fullNameController.text,
                      "address": addressController.text,
                      "city": cityController.text,
                      "state": stateController.text,
                      "zipcode": zipcodeController.text,
                      "country": valueListenable.value!,
                    }, context);
                    Provider.of<AddressProvider>(context, listen: false)
                        .setSelectedAddress({
                      "fullName": fullNameController.text,
                      "address": addressController.text,
                      "city": cityController.text,
                      "state": stateController.text,
                      "zipcode": zipcodeController.text,
                      "country": valueListenable.value!,
                    });
                    Provider.of<AddressProvider>(context, listen: false)
                        .retrieveAddresses();
                    Provider.of<AddressProvider>(context, listen: false)
                        .retrieveSetSelectedAddress();
                    Navigator.pop(context);
                    ;
                  },
                  child: Text(
                    "ADD ADDRESS",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 14.sp,
                        color: kColor.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
