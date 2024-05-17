import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reverse_vending_recycling/first_page.dart';

class HomePage extends StatefulWidget {
  final String phoneNumber;

  const HomePage({super.key, required this.phoneNumber});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String numberOfBottles = "0";
  int numberOfBottlesLocal = 0;
  String totalPoints = "0";

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        // Return false to disable back button
        return false;
      },
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(widget.phoneNumber,
                      style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1.0),
                          fontSize: 20.w,
                          fontWeight: FontWeight.bold)),
                ),
                toolbarHeight: 60.w,
                backgroundColor: Colors.green),
            body: Stack(
              children: [
                Container(
                  width: widthSize,
                  height: heightSize,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/plastic.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),
                /*
                Container(
                  width: widthSize,
                  height: heightSize,
                  color: Color.fromRGBO(8, 215, 220, 0.2)

                ),

                 */
                Container(
                  width: widthSize,
                  height: heightSize,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 30.w),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.w),
                            child: Container(
                              width: widthSize,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(165, 214, 167, 0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.w)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Text(
                                        "Total loyalty points",
                                        style: TextStyle(
                                            fontSize: 15.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Text(
                                        totalPoints.toString(),
                                        style: TextStyle(
                                            fontSize: 35.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.w),
                            child: Container(
                              width: widthSize,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(165, 214, 167, 0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.w)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Text(
                                        "Total bottles added now",
                                        style: TextStyle(
                                            fontSize: 15.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.w),
                                      child: Text(
                                        numberOfBottles.toString(),
                                        style: TextStyle(
                                            fontSize: 35.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.w)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.zero)),
                                              backgroundColor: Colors.white,
                                              content: Text(
                                                "Put the bottle inside and press the 'add' button below",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.w,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black,
                                                    elevation: 0,
                                                  ),
                                                  onPressed: () async {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.w,
                                                        bottom: 10.w),
                                                    child: Text(
                                                      "Add",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15.w,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black,
                                                    elevation: 0,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.w,
                                                        bottom: 10.w),
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15.w,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.green.shade100,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.w),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.w, bottom: 20.w),
                                        child: Text(
                                          "Add bottle",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FirstPage()),
                                            (route) => false);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.green.shade100,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.w),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.w, bottom: 20.w),
                                        child: Text(
                                          "Finish",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.w),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Copyrights Reserved",
                                  style: TextStyle(
                                      fontSize: 13.w, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void showToastMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[800] ?? Colors.blue,
                // Use Colors.red if Colors.red[800] is null
                Colors.blue[900] ?? Colors.blue,
                // Use Colors.red if Colors.red[900] is null
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.w),
          ),
          padding: EdgeInsets.all(16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.w,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
