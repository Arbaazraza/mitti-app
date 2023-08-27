
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'alert_box.dart';
import 'home_page.dart';
import 'package:intl/intl.dart';


class PurchaseProduct extends StatefulWidget {
  const PurchaseProduct({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PurchaseProduct> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PurchaseProduct> {

  String? product_name;
  TextEditingController quantity=TextEditingController();
  bool isLoading = false;
  List<String> prod=[];
  String? size;
  TextEditingController contact=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController costumername=TextEditingController();


  String? date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  Future<void> uploadInventoryInfo() async {

    if ( quantity.text.isNotEmpty &&
        address.text.isNotEmpty &&
        contact.text.isNotEmpty &&
        size!= null &&
        product_name!= null) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://mittitheapp.000webhostapp.com/Mitti the app/orders.php"));

      // request.files
      //     .add(await http.MultipartFile.fromPath('image', uploadimage!.path)
      // );

      request.fields["product_name"] = product_name!;
      request.fields["size"] =size!;
      request.fields["quantity"] = quantity.text;
      request.fields["costumer_name"] = costumername.text;
      request.fields["contact"] = contact.text;
      request.fields["address"] = address.text;
      request.fields["order_date"] = date!;


      var res = await request.send();

      if (res.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        quantity.clear();
        contact.clear();
        address.clear();
        costumername.clear();
        product_name=null;
        size=null;
        date=null;
        showModalBox("Success", "Your Order has been received", context);
        // ignore: avoid_print
        print(res);
      } else {
        setState(() {
          isLoading = false;
          showModalBox("Error", "Your Order has not been placed", context);
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
  var result2;
  var data;
  var data2;
  /// ***********************************/
  void getProduct() async {
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

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  /// ***********************************/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                const MyHomePage(title: 'Home Page')),
          );
        }, icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xffc9976b),
        title: const Text("Order Now"),
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
                            keyboardType: TextInputType.number,
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
                      height: 65,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child:  DropdownButton<String>(
                            hint: const Text("Select Size",style: TextStyle(color: Colors.white),),
                            isExpanded: true,
                            dropdownColor: const Color(0xffc9976b),
                            value:size,
                            icon: const Icon(Icons.arrow_downward,color: Colors.white,),
                            iconSize: 25,
                            elevation: 16,
                            underline: Container(
                              height: 0.0,
                              color: const Color(0xffc9976b),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                size = newValue!;
                                print(size);
                              });
                            },
                            items: <String>['Small','Medium','Large']
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
                            controller: costumername,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.man,
                                  color: Colors.white,
                                ),
                                labelText: "Costumer Name",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),),

                    SizedBox(
                      child:   Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: contact,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                                labelText: "Contact No",
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
                            controller: address,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                ),
                                labelText: "Address",
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ),),

                    GestureDetector(
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          lastDate:
                          DateTime.now().add(Duration(days: 1000)),
                          firstDate:
                          DateTime.now().subtract(Duration(days: 15)),
                          errorFormatText: "Out of range",
                        ).then((value) {
                          final DateFormat formatter =
                          DateFormat('dd-MM-yyyy');
                          final String formatted = formatter.format(value!);
                          setState(() {
                            date= formatted;
                          });
                        });
                      },
                      child: Row(
                        children: [
                          const Text("  Select Receiving date :"),
                          Container(
                            // color: const Color(0xffc9976b),
                            // alignment: Alignment,
                            width: 100.0,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.red, width: 0.5)
                                )),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              date.toString(),
                              style: const TextStyle(color:Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),

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
