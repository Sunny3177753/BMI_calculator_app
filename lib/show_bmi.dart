import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowBMI extends StatefulWidget {
  late int height;
  late int weight;
  ShowBMI({
    super.key,
    required this.height,
    required this.weight
  });

  @override
  State<ShowBMI> createState() => _ShowBMIState();
}

class _ShowBMIState extends State<ShowBMI> {

  late final double calculateBMI;
  String category = "Fit";




  @override

  void initState() {

    super.initState();
    calculateBMI = widget.weight/(pow(widget.height/100, 2));
    if(calculateBMI <18 ){
      category = "Under Weight";
    }else if(calculateBMI > 18 && calculateBMI < 25){
      category = "Fit";
    }else{
      category = "Over Weight";
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 8,
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.aladin(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: Card(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          shadowColor: Colors.yellow,

          child: Container(
            height: 200,
            width: 300,
            // decoration: BoxDecoration(
            //   color: Colors.blueGrey,
            //   borderRadius: BorderRadius.circular(20),
            // ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "${calculateBMI.toStringAsFixed(2)}",
                    style: GoogleFonts.aladin(
                        fontSize: 40,
                        fontWeight: FontWeight.w500
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Category : ${category}",
                    style: GoogleFonts.aladin(
                        fontSize: 30,
                        fontWeight: FontWeight.w500
                    ),
                  ),




                ],
              )
            ),
          ),
        ),
      )
    );
  }
}
