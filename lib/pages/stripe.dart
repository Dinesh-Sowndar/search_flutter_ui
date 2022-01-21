import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

class StripeTest extends StatefulWidget {
  const StripeTest({Key? key}) : super(key: key);

  @override
  _StripeTestState createState() => _StripeTestState();
}

class _StripeTestState extends State<StripeTest> {
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("AppBar"),
      //   centerTitle: true,
      //   actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      // ),
      body: Center(
        child:  TextButton(
            onPressed: () async {
              // create payment method
           
    //         stripe.PaymentMethod(
    //             id: "id",
    //   livemode: false,
    //   type: "type",
    //   card:stripe.Card(
    //   brand: "brand",
    //   country: "country",
    //   expMonth: 01,
    //   expYear:2022,
    //   funding: "funding",
    // ),
    //   auBecsDebit: const AuBecsDebit(),
    //   bacsDebit: const BacsDebit(),
    //   billingDetails: billing_details.parse(),
    //   fpx: const Fpx(),
    //   ideal: const Ideal(),
    //   sepaDebit: const SepaDebit(),
    //   sofort: const Sofort(),
    //   upi: const Upi(),
    //           );
             
             
              // final paymentMethod = await Stripe.instance
              //     .createPaymentMethod(BacsDebit(fingerprint: "ss",last4: "erre",sortCode: "sdssd"));
          
    
    final billingDetails = BillingDetails(
        name: "dinesh",
        email: 'dinesh@lokl.com',
        phone: "+91543453454",
        address: Address(
          city: "city",
          country: 'UK',
          line1: "line1",
          line2: 'dfsdf',
          state: "tamilnadu",
          postalCode:"636321",
        ),
      ); // mocked data for tests

    // PaymentMethod paymentMethod =
        await Stripe.instance.createPaymentMethod(
          PaymentMethodParams.card(billingDetails: billingDetails,)
    );
    // return paymentMethod;
            },
            child: Text('pay'),
          ),
      ),
    );
  }
}
