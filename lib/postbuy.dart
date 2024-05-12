import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PastBuyNow extends StatefulWidget {
  final String orderId;
  const PastBuyNow({super.key,required this.orderId});

  @override
  State<PastBuyNow> createState() => _PastBuyNowState();
}

class _PastBuyNowState extends State<PastBuyNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Item bought Successfully",style: GoogleFonts.eagleLake(fontSize:20,fontWeight:FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('orderId : ${widget.orderId}',style: GoogleFonts.abel(fontSize:18,fontWeight:FontWeight.w400),),
              )
            ],
          ),
        ),
      ),
    );
  }
}