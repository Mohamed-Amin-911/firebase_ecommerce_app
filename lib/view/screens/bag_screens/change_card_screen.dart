import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/credit_card_provider.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/add_card_bottom_sheet.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/master_card_widget.dart';
import 'package:ecommerce_app/view/widgets/check_out_screen_widgets/visa_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChangeCardScreen extends StatefulWidget {
  const ChangeCardScreen({super.key});

  @override
  State<ChangeCardScreen> createState() => _ChangeCardScreenState();
}

class _ChangeCardScreenState extends State<ChangeCardScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<CreditCardProvider>(context, listen: false).retrieveCards();
    Provider.of<CreditCardProvider>(context, listen: false)
        .retrieveDefaultCard();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cards =
        Provider.of<CreditCardProvider>(context, listen: true).cards;

    // Map<String, dynamic> defaultCard =
    //     Provider.of<CreditCardProvider>(context, listen: true).defaultCard;
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
          'Payment methods',
          style: appStyle(
              fw: FontWeight.w600, size: 18.sp, color: kColor.textColor),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Provider.of<CreditCardProvider>(context, listen: true).isLoading
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
            : cards.isEmpty
                ?
                //if list is empty
                Center(
                    child: SizedBox(
                      height: 310.h,
                      child: Column(
                        children: [
                          SizedBox(height: 160.h),
                          Text("No payment method",
                              style: appStyle(
                                  fw: FontWeight.w400,
                                  size: 20.sp,
                                  color: kColor.textColor)),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 31.h),
                        Text("Your payment cards",
                            style: appStyle(
                                fw: FontWeight.w600,
                                size: 16.sp,
                                color: kColor.textColor)),
                        SizedBox(height: 29.h),
                        Expanded(
                            child: ListView.builder(
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            return cards[index]["cardNumber"][0] == "5" ||
                                    cards[index]["cardNumber"][0] == "2"
                                ? MasterCard(
                                    defaultCard: cards[index],
                                    indexx: index,
                                    function: (value) {
                                      setState(() {
                                        Provider.of<CreditCardProvider>(context,
                                                listen: false)
                                            .setDefualtCard(
                                                cards.elementAt(index));
                                        Provider.of<CreditCardProvider>(context,
                                                listen: false)
                                            .setselectedIndex(index);
                                      });
                                      Provider.of<CreditCardProvider>(context,
                                              listen: false)
                                          .retrieveDefaultCard();
                                    },
                                  )
                                : VisaCard(
                                    defaultCard: cards[index],
                                    indexx: index,
                                    function: (value) {
                                      setState(() {
                                        Provider.of<CreditCardProvider>(context,
                                                listen: false)
                                            .setDefualtCard(
                                                cards.elementAt(index));
                                        Provider.of<CreditCardProvider>(context,
                                                listen: false)
                                            .setselectedIndex(index);
                                      });
                                      Provider.of<CreditCardProvider>(context,
                                              listen: false)
                                          .retrieveDefaultCard();
                                    },
                                  );
                          },
                        )),
                      ],
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          addCardWidget(context);
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
