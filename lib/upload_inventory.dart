
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'alert_box.dart';
import 'home_page.dart';


class UploadInventory extends StatefulWidget {
  const UploadInventory({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<UploadInventory> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UploadInventory> {

  String? operation_type;
  String? product_name;
  TextEditingController quantity=TextEditingController();
  TextEditingController discription=TextEditingController();
  bool isLoading = false;
  List<String> prod=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> uploadInventoryInfo() async {

    if ( quantity.text.isNotEmpty &&
        discription.text.isNotEmpty &&
        operation_type!= null &&
        product_name!= null) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://mittitheapp.000webhostapp.com/Mitti the app/upload_inventory.php"));

      // request.files
      //     .add(await http.MultipartFile.fromPath('image', uploadimage!.path)
      // );

      request.fields["OPERATION_TYPE"] = quantity.text;
      request.fields["PRODUCT_NAME"] = product_name!;
      request.fields["QUANTITY"] = quantity.text;
      request.fields["DISCRIPTION"] = discription.text;


      var res = await request.send();

      if (res.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        quantity.clear();
        discription.clear();
        product_name=null;
        operation_type=null;
        showModalBox("Success", "Data is Submitted Successfully", context);
        // ignore: avoid_print
        print(res);
      } else {
        setState(() {
          isLoading = false;
          showModalBox("Error", "Data is not Submitted Successfully", context);
        });
      }
    } else {
      setState(() {
        showModalBox("Error", "Please Filled All Field Properly", context);
        isLoading = false;
      });
    }
  }
  /// ***************************************************/


  var result;
  var data;
  /// ***********************************/
  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://mittitheapp.000webhostapp.com/Mitti the app/get_product.php"));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        result = jsonDecode(data!)['data']; //get all the data from json string hospital length
        for(int x=0;x<result.length;x++)
          {
            prod.add(result[x]['product_name']);
          }
        print(result); // just printed length of data
      });

    } else {
      print(response.statusCode);
    }
  }
  /// ***********************************/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        IconButton(onPressed: () { Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const MyHomePage(title: 'Home Page')),
        );}, icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xffc9976b),
        title: const Text("Upload Inventory"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.admin_panel_settings_rounded, size: 60,
                  color: Colors.black),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery
                      .of(context)
                      .size
                      .width * .04,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 65,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child:  DropdownButton<String>(
                            hint: const Text("Select operation type",style: TextStyle(color: Colors.white),),
                            isExpanded: true,
                            dropdownColor: const Color(0xffc9976b),
                            value:operation_type,
                            icon: const Icon(Icons.arrow_downward,color: Colors.white,),

                            iconSize: 25,
                            elevation: 16,
                            underline: Container(
                              height: 0.0,
                              color: const Color(0xffc9976b),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                operation_type = newValue!;
                                print(operation_type);
                              });
                            },
                            items: <String>['Selling','Stock holding','Stock Inventory']
                                .map<DropdownMenuItem<String>>((String value1) {
                              return DropdownMenuItem<String>(
                                value: value1,

                                child: Text(value1,style:  const TextStyle(color: Colors.white),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 65,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child:  DropdownButton<String>(
                            hint: const Text("Select product name",style: TextStyle(color: Colors.white),),
                            isExpanded: true,
                            dropdownColor: const Color(0xffc9976b),
                            value:product_name,
                            icon: const Icon(Icons.arrow_downward,color: Colors.white,),
                            iconSize: 25,
                            elevation: 16,
                            underline: Container(
                              height: 0.0,
                              color: const Color(0xffc9976b),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                product_name = newValue!;
                                print(product_name);
                              });
                            },
                            items: prod
                                .map<DropdownMenuItem<String>>((String value1) {
                              return DropdownMenuItem<String>(
                                value: value1,

                                child: Text(value1,style:  const TextStyle(color: Colors.white),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),



                    SizedBox(
                      child:   Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: quantity,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.production_quantity_limits,
                                  color: Colors.white,
                                ),
                                labelText: "Quantity",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),

                    ),

                    SizedBox(
                      child:   Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: discription,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.description,
                                  color: Colors.white,
                                ),
                                labelText: "Description",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),),

                    Card(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown,
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: uploadInventoryInfo,
                        child: const Text(
                          'Upload',
                          style: TextStyle(fontSize: 24),
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
    );
  }
}
