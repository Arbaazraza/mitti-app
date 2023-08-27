import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class ViewEmployees extends StatefulWidget {
  const ViewEmployees({Key? key, required String title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ViewEmployees> {
  String? data;
  var empoyees;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  /// ***********************************/
  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://mittitheapp.000webhostapp.com/Mitti the app/get_employee_list.php"));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        empoyees = jsonDecode(
            data!)['data']; //get all the data from json string hospital length
        print(empoyees); // just printed length of data
      });
    } else {
      print(response.statusCode);
    }
  }


  String s = '';
  _making_Phone_Call() async {
    String url = 'tel:' + s;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  /// ***********************************/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Employee"),
        backgroundColor: const Color(0xffc9976b),
      ),
      body: ListView.builder(
        itemCount: empoyees== null ? 0 :empoyees.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 8,
            margin: EdgeInsets.all(10),
            child:SingleChildScrollView(
              child: Container(
                height: 200,
                color: Colors.white,
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Expanded(
                          child:Image.network(
                            "https://mittitheapp.000webhostapp.com/Mitti the app/" +
                                empoyees[index]['image'],
                            fit: BoxFit.fill,
                            width: 100,
                            height: 175,
                            alignment: Alignment.center,
                          ),
                          flex:2 ,
                        ),
                      ),
                    ),
                    Expanded(
                      flex:8 ,
                      child:Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                const Text("Name-",style: TextStyle(fontWeight: FontWeight.w300),),
                                Text(
                                  empoyees[index]['name']
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 17, fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Adhaar Number-",style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Flexible(
                                  child: Text(
                                    empoyees[index]['adhaar_no']
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15, fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Employee Type-",style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Flexible(
                                  child: Text(
                                    empoyees[index]['employee_type']
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15, fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Day Charge-",style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Flexible(
                                  child: Text(
                                    empoyees[index]['charge']
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15, fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Address-",style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Flexible(
                                  child: Text(
                                    empoyees[index]['address']
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15, fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(

                              child: Row(

                                children: [
                                  const Icon(Icons.call),
                                  SizedBox(width: 10.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      color: Colors.red;
                                      setState(() {
                                      s = jsonDecode(data!)['data'][index]['contact']
                                          .toString();
                                      }
                                      );
                                      _making_Phone_Call();
                                      },
                                    child: Text(
                                      empoyees[index]['contact']
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 15, fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
          //   Card(
          //   shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(20)
          //       )
          //   ),
          //   color: Colors.white,
          //   elevation: 5.0,
          //   child: SizedBox(
          //     height: 200,
          //     child: Column(
          //       // crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: CircleAvatar(
          //                 child: Image.network(
          //                   "https://mypottery.000webhostapp.com/MyPottery/" +
          //                       products[index]['PIC'],
          //                   fit: BoxFit.fill,
          //                   width: 200,
          //                   height: 250,
          //                   alignment: Alignment.center,
          //                 ),
          //                 radius: 40,
          //               ),
          //             ),
          //             Flexible(
          //                 child: FittedBox(
          //                   child: Text(
          //                     products[index]['PRODUCT_NAME']
          //                         .toString(),
          //                     style: const TextStyle(
          //                         fontSize: 20, fontFamily: 'Montserrat',
          //                         fontWeight: FontWeight.bold
          //                     ),
          //                   )
          //                 )
          //             ),
          //           ],
          //         ),
          //         const FittedBox(
          //           child: Text(
          //             "Description-",
          //             style: TextStyle( fontWeight: FontWeight.w300),
          //           ),
          //         ),
          //         // const SizedBox(
          //         //   height: 5,
          //         // ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: [
          //             Container(
          //               margin: const EdgeInsets.only(left: 15.0),
          //               child: const Text("MRP- ",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold
          //                   )),
          //             ),
          //             FlatButton(
          //               onPressed: (){},
          //               color: Colors.green,
          //               child: Text(
          //                   products[index]['PRODUCT_MRP']
          //                       .toString(),
          //                   style: const TextStyle(
          //                       fontWeight: FontWeight.bold,color: Colors.white
          //                   )),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Container(
          //               margin: const EdgeInsets.only(left: 15.0),
          //               child: const FittedBox(
          //                 child: Text(
          //                   "Description- ",
          //                   style: TextStyle( fontWeight: FontWeight.w300),
          //                 ),
          //               ),
          //             ),
          //             // Flexible(
          //             //   child: FittedBox(
          //             //     child: Text(
          //             //         products[index]['DESCRIPTION']
          //             //             .toString(),
          //             //         style: const TextStyle(
          //             //           fontWeight: FontWeight.w300,
          //             //         )),
          //             //   ),
          //             // ),
          //           ],
          //         ),
          //
          //
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
