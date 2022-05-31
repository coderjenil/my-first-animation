import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

  Color male = Colors.black;
  Color female = Colors.black;
  double value = 50;
  double weight = 0;
  double age = 0;

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}
class _BmiPageState extends State<BmiPage> with TickerProviderStateMixin {

  late final AnimationController _controller;
  GlobalKey globalKey = GlobalKey();
  late FToast fToast;


  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.black,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.error,color: Colors.white,),
        SizedBox(
          width: 12.0,
        ),
        Text("Please Enter All Details",style: TextStyle(color: Colors.white),),
      ],
    ),
  );

  _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 2000,
        ),
        lowerBound: -1,
        upperBound: 0);
    _controller.forward();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              male = Colors.black;
              female = Colors.black;
              value = 50;
              weight = 0;
              age = 0;
              setState(() {
              });
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: _controller,
                    child: InkWell(
                      onTap: () {
                        female = Colors.black;
                        male = (male == Colors.black)
                            ? const Color(0xff0A8F08)
                            : Colors.black;
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3))
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 100,
                              color: male,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(fontSize: 30, color: male),
                            ),
                          ],
                        ),
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(_controller.value * 100, 0),
                        child: child,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _controller,
                    child: InkWell(
                      onTap: () {
                        male = Colors.black;
                        female = (female == Colors.black)
                            ? const Color(0xff0A8F08)
                            : Colors.black;
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3))
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 100,
                              color: female,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(fontSize: 30, color: female),
                            ),
                          ],
                        ),
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(_controller.value * -100, 0),
                        child: child,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 10,
                    ),
                    const Text(
                      "HEIGHT",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${value.toInt()}",
                          style: const TextStyle(fontSize: 50),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Slider(
                        activeColor: const Color(0xff0A8F08),
                        inactiveColor: const Color(0xff0A8F08).withOpacity(0.3),
                        min: 50,
                        max: 300,
                        value: value,
                        onChanged: (val) {
                          value = val;
                          setState(() {});
                        }),
                  ],
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(_controller.value * -100, 0),
                  child: child,
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: _controller,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            "${weight.toInt()}",
                            style: const TextStyle(fontSize: 50),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                  });
                                  weight++;
                                },
                                child: CircleAvatar(
                                  radius: 28,
                                    child: const Icon(Icons.add,color: Colors.black,size: 30,),
                                    backgroundColor: const Color(0xff0A8F08).withOpacity(0.2)),
                              ),
                              InkWell(
                                onTap: (){
                                  if(weight>0)
                                    {
                                      weight--;
                                      setState(() {
                                      });
                                    }
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                    child: const Text("-",style: TextStyle(color: Colors.black,fontSize: 30),),
                                    backgroundColor: const Color(0xff0A8F08).withOpacity(0.2)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(_controller.value * 100, 0),
                        child: child,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _controller,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            "${age.toInt()}",
                            style: const TextStyle(fontSize: 50),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                  });
                                  age++;
                                },
                                child: CircleAvatar(
                                    radius: 28,
                                    child: const Icon(Icons.add,color: Colors.black,size: 30,),
                                    backgroundColor: const Color(0xff0A8F08).withOpacity(0.2)),
                              ),
                              InkWell(
                                onTap: (){
                                  if(age>0)
                                  {
                                    age--;
                                    setState(() {
                                    });
                                  }
                                },
                                child: CircleAvatar(
                                    radius: 30,
                                    child: const Text("-",style: TextStyle(color: Colors.black,fontSize: 30),),
                                    backgroundColor: const Color(0xff0A8F08).withOpacity(0.2)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(_controller.value * -100, 0),
                        child: child,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 102.5,vertical: 20),
              primary: const Color(0xff0A8F08),
            ),
              onPressed: () async{
              if(weight != 0 && age != 0 && (male != Colors.black || female != Colors.black))
                {
                  print("hello");
              Navigator.of(context).pushNamed("result_page");
                }
              else
                {
                _showToast();
                }
              },
              child: const Text("CALCULATE YOUR BMI",style: TextStyle(fontSize: 15),),
          ),
        ],
      ),
    );
  }
}
