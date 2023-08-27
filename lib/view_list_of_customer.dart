import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class ViewCustomer extends StatefulWidget {
  const ViewCustomer({Key? key, required String title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ViewCustomer> {
  String? data;
  var customer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  /// ***********************************/
  void getData()  async {
    http.Response response = await http.get(Uri.parse(
        "https://mittitheapp.000webhostapp.com/Mitti the app/get_costumer.php"));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
       customer = jsonDecode(
            data!)['data']; //get all the data from json string hospital length
        print(customer); // just printed length of data
      });
    } else {
      print(response.statusCode);
    }
  }


  String s = '';
  _making_Phone_Call() async {
    String url = 'tel:$s';
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
        title: const Text("List of Customers"),
        backgroundColor: const Color(0xffc9976b),
      ),
      body: ListView.builder(
        itemCount: customer== null ? 0 :customer.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 8,
            margin: const EdgeInsets.all(10),
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
                          flex:2 ,
                          child:Image.network(
                            "https://mittitheapp.000webhostapp.com/Mitti the app/" +
                                customer[index]['image'],
                            fit: BoxFit.fill,
                            width: 100,
                            height: 175,
                            alignment: Alignment.center,
                          ),
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
                                  customer[index]['owner_name']
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
                                  "Shop Name-",style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Flexible(
                                  child: Text(
                                    customer[index]['shop_name']
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
                                    customer[index]['address']
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
                                  const SizedBox(width: 10.0),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        s = jsonDecode(data!)['data'][index]['contact_no']
                                            .toString();
                                      });
                                      _making_Phone_Call();
                                    },
                                    child: Text(
                                      customer[index]['contact_no']
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
        
        },
      ),
    );
  }
}
