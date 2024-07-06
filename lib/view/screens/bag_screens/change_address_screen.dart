import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/address_provider.dart';
import 'package:ecommerce_app/view/screens/bag_screens/add_address_screen.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/address_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({super.key});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<AddressProvider>(context, listen: false).retrieveAddresses();
    Provider.of<AddressProvider>(context, listen: false)
        .retrieveSetSelectedAddress();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> addresses =
        Provider.of<AddressProvider>(context, listen: true).addresses;

    return Scaffold(
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
          'Shipping Addresses',
          style: appStyle(
              fw: FontWeight.w600, size: 18.sp, color: kColor.textColor),
        ),
      ),
      body: Provider.of<AddressProvider>(context, listen: true).isLoading
          ?
          //if data is loading
          Center(
              child: SizedBox(
                height: 310.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 160.h),
                    const Center(
                      child: CircularProgressIndicator(
                        color: kColor.textColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Expanded(
              child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, indexx) {
                return addressCard((value) {
                  setState(() {
                    Provider.of<AddressProvider>(context, listen: false)
                        .setSelectedAddress(addresses.elementAt(indexx));
                    Provider.of<AddressProvider>(context, listen: false)
                        .setselectedIndex(indexx);
                  });
                  Provider.of<AddressProvider>(context, listen: false)
                      .retrieveSetSelectedAddress();
                }, addresses, indexx, context);
              },
            )),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddAddressScreen(),
              ));
        },
        backgroundColor: kColor.textColor,
        child: const Icon(
          Icons.add,
          color: kColor.whiteColor,
        ),
      ),
    );
  }
}
