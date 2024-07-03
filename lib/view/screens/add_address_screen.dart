import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/address_provider.dart';
import 'package:ecommerce_app/view/widgets/outlined_input_border.dart';
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

class AddressInputFields extends StatelessWidget {
  const AddressInputFields({
    super.key,
    required this.fullNameController,
    required this.addressController,
    required this.cityController,
    required this.stateController,
    required this.zipcodeController,
    required this.countries,
    required this.valueListenable,
  });

  final TextEditingController fullNameController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController zipcodeController;
  final List<String> countries;
  final ValueNotifier<String?> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField2Widget(
          controller: fullNameController,
          label: "Full Name",
        ),
        SizedBox(height: 20.h),
        TextField2Widget(
          controller: addressController,
          label: "Address",
        ),
        SizedBox(height: 20.h),
        TextField2Widget(
          controller: cityController,
          label: "City",
        ),
        SizedBox(height: 20.h),
        TextField2Widget(
          controller: stateController,
          label: "State/Province/Region",
        ),
        SizedBox(height: 20.h),
        TextField2Widget(
          controller: zipcodeController,
          label: "Zip Code (Postal Code)",
        ),
        SizedBox(height: 20.h),
        //country drop down
        SizedBox(
          height: 63.h,
          width: 327.w,
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kColor.whiteColor),
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            hint: Text(
              'Country',
              style: appStyle(
                  fw: FontWeight.w500, size: 14.sp, color: kColor.text2Color),
            ),
            items: countries
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: kColor.textColor),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              valueListenable.value = value;
            },
            iconStyleData: const IconStyleData(
                icon: Icon(
              Icons.arrow_right_rounded,
              color: kColor.textColor,
            )),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class TextField2Widget extends StatelessWidget {
  const TextField2Widget({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63.h,
      width: 327.w,
      child: TextFormField(
        maxLines: 10,
        controller: controller,
        cursorColor: kColor.textColor,
        cursorWidth: 1,
        obscureText: false,
        keyboardType: TextInputType.text,
        style: TextStyle(
            height: 1.5,
            fontFamily: "Metropolis",
            fontSize: 14.sp,
            color: kColor.textColor,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelStyle: TextStyle(
              fontFamily: "Metropolis",
              fontSize: 14.sp,
              color: kColor.text2Color,
              fontWeight: FontWeight.w500),
          labelStyle: TextStyle(
            fontFamily: "Metropolis",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: kColor.text2Color,
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: kColor.whiteColor,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kColor.whiteColor)),
          contentPadding: EdgeInsets.only(top: 7.h, left: 20.w, bottom: 10.h),
          border: const OutlinedInputBorder(),
        ),
      ),
    );
  }
}
