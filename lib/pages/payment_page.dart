import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String showBackView = '';
  bool isCvvFocused = false;

  // user want to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //  only show dialog if form is valid
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Confirm password'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('Card Number:  $cardNumber'),
                      Text('Expiry Date:  $expiryDate'),
                      Text('Card Holder name:  $cardHolderName'),
                      Text('cvv:  $cvvCode'),
                    ],
                  ),
                ),
                actions: [
                  // cancel button
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),

                  // yes button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const DeliveryProgressPage())));
                      },
                      child: const Text('Yes')),
                ],
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // credit card
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),

            // Credit card form
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              formKey: formKey,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
            ),

            const SizedBox(
              height: 80,
            ),

            MyButton(onTap: userTappedPay, text: 'Pay now')
          ],
        ),
      ),
    );
  }
}
