import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/widgets/text_field_2_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
