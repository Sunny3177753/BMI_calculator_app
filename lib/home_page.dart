import 'package:dynamic_ui_app/show_bmi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'custom_card.dart';


class HomePage extends StatefulWidget {
  late bool isDark;
  final VoidCallback toggleTheme;

  HomePage({
    super.key,
    required this.isDark,
    required this.toggleTheme
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ///Variables
  int heightSlider = 140;
  int weight = 60;
  int age = 25;
  Color maleColor = selectedColor;
  Color femaleColor = Color(0xff033e66);
  String? gender;

  ///Functions
  void selectGender(bool isMale){

    if(isMale){
      setState(() {
        femaleColor = blueColor;
        maleColor = selectedColor;
      });
    }else{
      setState(() {
        maleColor = blueColor;
        femaleColor = selectedColor;
      });
    }

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

        actions: [
          IconButton(
              onPressed: widget.toggleTheme,
              icon: widget.isDark ? Icon(Icons.light_mode_outlined,color: Colors.white,) : Icon(Icons.dark_mode_outlined,color: Colors.white,))
        ],

      ),

      body: Column(
        children: [

          ///First column
         Expanded(child: Row(children: [
           Expanded(

             ///MALE Container
            child: GestureDetector(

              onTap: (){
                setState(() {
                  selectGender(true);
                  gender = "male";
                });
              },

              child: ReusableCard(
                colour: maleColor,
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.male,
                        size: 80
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "Male",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 50
                      ),
                    )
                  ],
                ),
              ),
            ),
           ),

           Expanded(

             ///FEMALE Container
             child: GestureDetector(

               onTap: (){
                 setState(() {
                   selectGender(false);
                   gender = "female";
                 });
               },

               child: ReusableCard(
                 colour: femaleColor,
                 child: Column(
                   children: [

                     Padding(
                       padding: EdgeInsets.all(12.0),
                       child: Icon(
                           Icons.female,
                           size: 80
                       ),
                     ),

                     const SizedBox(height: 5),

                     Text(
                       "Female",
                       style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 50
                       ),
                     )

                   ],
                 ),
               ),
             )
           )

         ],)),


          ///Second Column
          Expanded(
            child: ReusableCard(
              colour: blueColor,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),

                  // const SizedBox(height: 5,),

                  Text(
                    "${heightSlider} cm",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  const SizedBox(height: 4,),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Slider(
                      value: heightSlider.toDouble(),
                      inactiveColor: Colors.pink,
                      thumbColor: Colors.orange,
                      activeColor: Colors.purpleAccent,
                      min: 80,
                      max: 220,
                      divisions: 120,
                      onChanged: (value){
                      setState(() {
                        heightSlider = value.toInt();
                      });
                    },),
                  )
                ],
              ),
            )
          ),


          ///Third Column
          Expanded(child: Row(children: [

            Expanded(
              child: ReusableCard(
                colour: blueColor,

                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "AGE",
                        style:  TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    ///wight customize
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        ///subtract AGE
                        FloatingActionButton(
                          backgroundColor: darkBlueColor,                          shape: CircleBorder(),
                          splashColor: Colors.grey,
                          onPressed: (){
                            setState(() {
                              if(age>5){
                                age--;
                              }
                            });
                            }, child: Icon(Icons.remove,size: 40,)
                        ),

                        const SizedBox(width: 10),

                        ///dynamic WEIGHT Text
                        Text(
                          "${age}",
                          style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 40
                          ),
                        ),

                        const SizedBox(width: 10),

                        ///add AGE
                        FloatingActionButton(
                            backgroundColor: darkBlueColor,
                            shape: CircleBorder(),
                            splashColor: Colors.grey,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            }, child: Icon(Icons.add,size: 40,)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: ReusableCard(
                colour: blueColor,
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "WEIGHT",
                        style:  TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 40
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    ///wight customize
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        ///subtract weight
                        FloatingActionButton(
                            backgroundColor: darkBlueColor,                          shape: CircleBorder(),
                            splashColor: Colors.grey,
                            onPressed: (){
                              setState(() {
                                if(weight>20){
                                  weight--;
                                }
                              });
                            }, child: Icon(Icons.remove,size: 40,)
                        ),

                        const SizedBox(width: 10),

                        ///Dynamic WEIGHT text
                        Text(
                          "${weight}",
                          style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 40
                          ),
                        ),

                        const SizedBox(width: 10),

                        ///add WEIGHT
                        FloatingActionButton(
                          elevation: 10.0,
                            backgroundColor: darkBlueColor,
                            shape: CircleBorder(),
                            splashColor: Colors.grey,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            }, child: Icon(Icons.add,size: 40,)
                        ),
                      ],
                    )
                  ],
                ),
              )
            )
          ],),),

          ///access button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Expanded(
              child: SafeArea(
                child: GestureDetector(

                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (build) => ShowBMI(height: heightSlider,weight: weight))
                    );
                  },

                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink,
                      ),

                    child: Center(
                      child: Text(
                        "Calculate BMI",
                        style: GoogleFonts.aladin(
                          fontSize: 50,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    ),
                ),
              ),
            ),
          ],
        )
        ],
      )
    );
  }
}









