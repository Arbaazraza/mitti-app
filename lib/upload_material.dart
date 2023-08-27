import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'alert_box.dart';
import 'home_page.dart';


class UploadMaterial extends StatefulWidget {
  const UploadMaterial({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<UploadMaterial> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UploadMaterial> {
  ImagePicker picker = ImagePicker();
  XFile? uploadimage;
  bool isLoading = false;

  TextEditingController materialname = TextEditingController();
  TextEditingController vendorname = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController vendoramount= TextEditingController();
  TextEditingController materialquantity= TextEditingController();

  /// *******/
  Future<void> uploadCustomerInfo() async {
    // ignore: unrelated_type_equality_checks
    if (materialname.text.isNotEmpty &&
        vendoramount.text.isNotEmpty &&
        contactNo.text.isNotEmpty &&
        address.text.isNotEmpty &&
        vendorname.text.isNotEmpty &&
        materialquantity.text.isNotEmpty &&
        uploadimage != null) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://mittitheapp.000webhostapp.com/Mitti the app/upload_mat.php"));

      request.files
          .add(await http.MultipartFile.fromPath('image', uploadimage!.path));

      request.fields["material_name"] = materialname.text;
      request.fields["vendor_name"] = vendorname.text;
      request.fields["quantity"] = materialquantity.text;
      request.fields["amount"] = vendoramount.text;
      request.fields["contact"] = contactNo.text;
      request.fields["address"] = address.text;


      // request.fields["desig"] = designationName!;
      var res = await request.send();

      if (res.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        materialname.clear();
        materialquantity.clear();
        contactNo.clear();
        address.clear();
        vendoramount.clear();
        vendorname.clear();
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
        leading: IconButton(
            onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const MyHomePage(title: 'Home Page')),
            );}, icon: const Icon(Icons.arrow_back
        )),
        backgroundColor: const Color(0xffc9976b),
        title: const Text("Upload Material"),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                    const SizedBox(height: 10.0),
                    SizedBox(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: TextFormField(
                          controller: materialname,
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
                                  child:Icon(Icons.add_shopping_cart_rounded,color: Colors.white,)
                              ),
                              hintText: 'Material Name:',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
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
                          controller: vendorname,
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
                                  child:Icon(Icons.account_circle,color: Colors.white,)
                              ),
                              hintText: 'Vendor Name:',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
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
                          controller: materialquantity,
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
                              // contentPadding: EdgeInsets.symmetric(vertical: 13.0),,border: InputBorder.none,
                              // isDense: true,
                              prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 17.0,right: 20),
                                  child:Icon(Icons.production_quantity_limits_rounded,color: Colors.white,)
                              ),
                              hintText: 'Material Quantity:',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
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
                          controller: vendoramount,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.phone,
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
                                  child:Icon(Icons.numbers_rounded,color: Colors.white,)
                              ),
                              hintText: 'Vendor Amount:',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
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
                          controller: contactNo,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.left,
                          maxLength: 10,

                          style: const TextStyle(
                              fontSize: 15.0, color: Colors.white),
                          decoration: const InputDecoration(
                              counterText: "",
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
                                  child:Icon(Icons.call_end_rounded,color: Colors.white,)
                              ),
                              hintText: 'Contact Number:',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
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
                          controller: address,
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
                                  child:Icon(Icons.location_on_rounded,color: Colors.white,)
                              ),
                              hintText: 'Address:',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                      ),
                    ),
                    Card(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown,
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: uploadCustomerInfo,
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
}
