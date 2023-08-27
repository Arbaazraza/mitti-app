import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'alert_box.dart';
import 'home_page.dart';


class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AddCustomer> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddCustomer> {



  ImagePicker picker = ImagePicker();
  ImagePicker picker2 = ImagePicker();
  XFile? uploadimage;
  XFile? uploadimage2;
  bool isLoading = false;

  TextEditingController ShopName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController ownerName= TextEditingController();
  // TextEditingController shopRoute= TextEditingController();

  /// *******/
  Future<void> uploadCustomerInfo() async {
    // ignore: unrelated_type_equality_checks
    if (ShopName.text.isNotEmpty &&
        password.text.isNotEmpty &&
        contactNo.text.isNotEmpty &&
        address.text.isNotEmpty &&
        ownerName.text.isNotEmpty &&
        // shopRoute.text.isNotEmpty &&
        uploadimage != null) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://mittitheapp.000webhostapp.com/Mitti the app/add_customer.php"));

      request.files
          .add(await http.MultipartFile.fromPath('image', uploadimage!.path));

      request.fields["shop_name"] = ShopName.text;
      request.fields["password"] = password.text;
      request.fields["contact_no"] = contactNo.text;
      request.fields["address"] = address.text;
      request.fields["owner_name"] = ownerName.text;
      //request.fields["SHOP_ROUTE"] = shopRoute.text;


      // request.fields["desig"] = designationName!;
      var res = await request.send();

      if (res.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        ShopName.clear();
        password.clear();
        contactNo.clear();
        address.clear();
        ownerName.clear();
        // shopRoute.clear();
        uploadimage = null;
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

  /// *******/


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
        );
        }, icon: const Icon(Icons.group_add_sharp)),
        backgroundColor: const Color(0xffc9976b),
        title: const Text("Add Customer"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .04,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: uploadimage == null
                        ? Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF111D3A),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                        color: Color(0xffc9976b),
                      ),
                    )
                        : Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(
                              File(uploadimage!.path.toString())),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        controller: ShopName,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
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
                            // isDense: true,
                            fillColor: Color(0xffc9976b),
                            // contentPadding: EdgeInsets.symmetric(vertical: 13.0),
                            border: InputBorder.none,
                            // isDense: true,
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 17.0,right: 20),
                                child:Icon(Icons.shop_2_outlined,color: Colors.white,)
                            ),
                            hintText: 'Shop Name',
                            hintStyle: TextStyle(
                                fontSize: 15.0, color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        controller: ownerName,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
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
                            // isDense: true,
                            fillColor: Color(0xffc9976b),
                            // contentPadding: EdgeInsets.symmetric(vertical: 13.0),
                            border: InputBorder.none,
                            // isDense: true,
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 17.0,right: 20),
                                child:Icon(Icons.person,color: Colors.white,)
                            ),
                            hintText: 'owner Name',
                            hintStyle: TextStyle(
                                fontSize: 15.0, color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        controller: password,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
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
                            // isDense: true,
                            fillColor: Color(0xffc9976b),
                            // contentPadding: EdgeInsets.symmetric(vertical: 13.0),
                            border: InputBorder.none,
                            // isDense: true,
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 17.0,right: 20),
                                child:Icon(Icons.lock_clock_rounded,color: Colors.white,)
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 15.0, color: Colors.white)),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10,),
                  // EmployeeName(title: "Employee Aadhaar"),

                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        maxLength: 10,
                        // obscureText: false,
                        controller: contactNo,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
                        decoration: const InputDecoration(
                          counterText: "",
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(
                                  color: Color(0xffc9976b), width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            // isDense: true,
                            fillColor: Color(0xffc9976b),
                            // contentPadding: EdgeInsets.symmetric(vertical: 13.0),
                            border: InputBorder.none,
                            // isDense: true,
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 17.0, right: 20),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                )),
                            hintText: 'Contact Number',
                            hintStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10,),
                  // EmployeeName(title: "Employee Aadhaar"),


                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        controller: address,
                        keyboardType: TextInputType.streetAddress,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
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
                            // isDense: true,
                            fillColor: Color(0xffc9976b),
                            // contentPadding: EdgeInsets.symmetric(vertical: 13.0),
                            border: InputBorder.none,
                            // isDense: true,
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 17.0,right: 20),
                                child:Icon(Icons.home,color: Colors.white,)
                            ),
                            hintText: 'Address',
                            hintStyle: TextStyle(
                                fontSize: 15.0, color: Colors.white)),
                      ),
                    ),
                  ),

                  // const SizedBox(height: 10,),
                  // EmployeeName(title: "Employee Aadhaar"),

                  const SizedBox(
                    height: 7,
                  ),


                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),

                      onPressed: () { uploadCustomerInfo(); },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),

                  ),
                  const SizedBox(height: 15.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      chooseImageFromGalary();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    chooseImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<void> chooseImageFromGalary() async {
    XFile? choosedimage = await picker.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = choosedimage!;
    });
  }

  Future<void> chooseImageFromCamera() async {
    XFile? choosedimage = await picker.pickImage(source: ImageSource.camera);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = choosedimage!;
    });
  }

  void showImagePicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      chooseImageFromGalary2();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    chooseImageFromCamera2();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<void> chooseImageFromGalary2() async {
    XFile? choosedimage2 = await picker2.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage2 = choosedimage2!;
    });
  }

  Future<void> chooseImageFromCamera2() async {
    XFile? choosedimage2 = await picker2.pickImage(source: ImageSource.camera);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage2 = choosedimage2!;
    });
  }
}