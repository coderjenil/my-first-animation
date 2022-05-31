import 'package:flutter/material.dart';

import 'bmi_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  int ans = 0;
  int height = 0;
  String? finalAns;

  @override
  void initState() {
    super.initState();

    height = value~/100;
    ans = weight~/(height * height);

    if(ans < 5)
      {
        finalAns = "Underweight";
      }
    else if(ans < 85)
      {
        finalAns = "Healthy weight";
      }else if(ans < 95)
      {
        finalAns = "At risk of overweight";
      }
      else
      {
        finalAns = "Overweight";

      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Your BMI Result",style: TextStyle(fontSize: 25)),
        backgroundColor: const Color(0xff0A8F08),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            const Text("Normal Weight",style: TextStyle(color: Color(0xff0A8F08),fontWeight: FontWeight.bold,fontSize: 25),),
            Text("$ans",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 60),),
            Text("$finalAns",style: const TextStyle(color: Color(0xff0A8F08),fontWeight: FontWeight.bold,fontSize: 25),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 127,vertical: 20),
                primary: const Color(0xff0A8F08),
              ),
              onPressed: (){
                Navigator.of(context).pushNamed("bmi_page");
                male = Colors.black;
                female = Colors.black;
                value = 50;
                weight = 0;
                age = 0;
              },
              child: const Text("RE-CALCULATE",style: TextStyle(fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }
}
