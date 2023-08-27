
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'alert_box.dart';
import 'home_page.dart';


class Expenses extends StatefulWidget {
  const Expenses({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Expenses> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Expenses> {

  TextEditingController amount=TextEditingController();
  TextEditingController description=TextEditingController();
  bool isLoading = false;
  List<String> prod=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> uploadInventoryInfo() async {

    if ( amount.text.isNotEmpty &&
        description.text.isNotEmpty
    ) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://mittitheapp.000webhostapp.com/Mitti the app/expenses.php"));

      // request.files
      //     .add(await http.MultipartFile.fromPath('image', uploadimage!.path)
      // );


      request.fields["AMOUNT"] = amount.text;
      request.fields["DESCRIPTION"] = description.text;


      var res = await request.send();

      if (res.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        amount.clear();
        description.clear();
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
        "https://mypottery.000webhostapp.com/MyPottery/GetProductJson.php"));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        result = jsonDecode(data!)['data']; //get all the data from json string hospital length
        for(int x=0;x<result.length;x++)
        {
          prod.add(result[x]['PRODUCT_NAME']);
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
        title: const Text("Daily Basis Expenses"),
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
                      child:   Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: amount,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.money_off_csred_rounded,
                                  color: Colors.white,
                                ),
                                labelText: "Amount",
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
                            controller: description,
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
