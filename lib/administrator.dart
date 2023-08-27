import 'dart:convert';
import 'package:Mitti_the_app/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'alert_box.dart';
import 'home_page.dart';

class Administrator extends StatefulWidget {
  const Administrator({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Administrator> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Administrator> {
  TextEditingController userid = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isLoading = false;

  String? data;
  var manager;
  late int index = 0;

  @override
  void initState() {
    super.initState();
    getManager();
  }

  void getManager() async {
    http.Response response = await http.get(Uri.parse(
        "https://mypottery.000webhostapp.com/MyPottery/GetManagerAuthentication.php"));
    if (response.statusCode == 200) {
      data = response.body;
      setState(() {
        manager = jsonDecode(data!)['data'];
        print(manager);
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage(title: 'Login page')),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xffc9976b),
        title: const Text("Manager"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .04,
                ),
                child: Column(
                  children: [
                    const Icon(Icons.person_pin, size: 80.0, color: Colors.black),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 65,
                      child: Card(
                        color: const Color(0xffc9976b),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          controller: userid,
                          style: const TextStyle(fontSize: 15.0, color: Colors.white),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(color: Color(0xffc9976b), width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Color(0xffc9976b),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 17.0, right: 20),
                              child: Icon(
                                Icons.important_devices,
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'User ID:',
                            hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          controller: pass,
                          obscureText: true, // Hide password
                          style: const TextStyle(fontSize: 15.0, color: Colors.white),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(color: Color(0xffc9976b), width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Color(0xffc9976b),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 17.0, right: 20),
                              child: Icon(Icons.lock_open, color: Colors.white),
                            ),
                            hintText: 'Password:',
                            hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.brown),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (userid.text.toString() == "arbaaz" &&
                              pass.text.toString() == "arbaaz123" ||
                              userid.text.toString() == "ashhar" &&
                                  pass.text.toString() == "ashhar123" ||
                              userid.text.toString() == "abu" &&
                                  pass.text.toString() == "abu123" ||
                              userid.text.toString() == "jayakaruna" &&
                                  pass.text.toString() == "jayakaruna123" ||
                              userid.text.toString() == "manager" &&
                                  pass.text.toString() == "manager123") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyHomePage(title: "Home Page")),
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Wrong UserID or password",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 10.0,
                            );
                            print("Sorry Id or Password is wrong");
                          }
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 0.8, fontWeight: FontWeight.bold),
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
