import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'alert_box.dart';
import 'home_page.dart';


class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AddEmployee> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddEmployee> {
  ImagePicker picker = ImagePicker();
  ImagePicker picker2 = ImagePicker();
  XFile? uploadimage;
  XFile? uploadimage2;
  bool isLoading = false;

  TextEditingController employee_name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController adhaar_no = TextEditingController();
  TextEditingController charge = TextEditingController();
  TextEditingController address = TextEditingController();

  String? employee_type;
  String? employee_destination;

  /// *******************************************************/
  Future<void> uploadDoctorInfo() async {
    // ignore: unrelated_type_equality_checks
    if (employee_name.text.isNotEmpty &&
        contact.text.isNotEmpty &&
        address.text.isNotEmpty &&
        charge.text.isNotEmpty &&
        adhaar_no.text.isNotEmpty &&
        uploadimage != null
    ) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://mittitheapp.000webhostapp.com/Mitti the app/add_employee.php"));

      request.files
          .add(await http.MultipartFile.fromPath('image', uploadimage!.path));
      // request.files
      //     .add(await http.MultipartFile.fromPath('image2', uploadimage2!.path));

      request.fields["name"] = employee_name.text;
      request.fields["contact"] = contact.text;
      request.fields["adhaar_no"] = adhaar_no.text;
      request.fields["address"] = address.text;
      request.fields["charge"] = charge.text;
      request.fields["employee_type"] = employee_type!;

      // request.fields["desig"] = designationName!;
      var res = await request.send();

      if (res.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        employee_name.clear();
        contact.clear();
        adhaar_no.clear();
        address.clear();
        charge.clear();
        employee_type=null;
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

  /// ***************************************************/

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
        );}, icon: const Icon(Icons.person_add)),
        backgroundColor: const Color(0xffc9976b),
        title: const Text("Add Employee"),
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
                        controller: employee_name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
                        decoration: const InputDecoration(
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
                                  Icons.person_add,
                                  color: Colors.white,
                                )),
                            hintText: 'Employee Name',
                            hintStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                      ),
                    ),
                  ),

                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        controller: contact,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
                        decoration: const InputDecoration(
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


                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        maxLength: 12,
                        controller: adhaar_no,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
                        decoration: const InputDecoration(
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
                                  Icons.perm_identity,
                                  color: Colors.white,
                                )),
                            hintText: 'Adhaar Number',
                            hintStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                      ),
                    ),
                  ),

                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        maxLength: 10,
                        controller: address,
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
                                  Icons.add_business_rounded,
                                  color: Colors.white,
                                )),
                            hintText: 'Address',
                            hintStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
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
                        child: DropdownButton<String>(
                          hint: const Text(
                            "Employee Type",
                            style: TextStyle(color: Colors.white),
                          ),
                          isExpanded: true,
                          dropdownColor: const Color(0xffc9976b),
                          value: employee_type,
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          iconSize: 25,
                          elevation: 16,
                          underline: Container(
                            height: 0.0,
                            color: const Color(0xffc9976b),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              employee_type = newValue!;
                              print(employee_type);
                            });
                          },
                          items: <String>[
                            'Monthly',
                            'Day Vise',
                            'Hourly'
                          ].map<DropdownMenuItem<String>>((String value1) {
                            return DropdownMenuItem<String>(
                              value: value1,
                              child: Text(
                                value1,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    child: Card(
                      color: const Color(0xffc9976b),
                      child: TextFormField(
                        controller: charge,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.white),
                        decoration: const InputDecoration(
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
                                  Icons.attach_money_rounded,
                                  color: Colors.white,
                                )),
                            hintText: 'Charge',
                            hintStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                      ),
                    ),
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
                      onPressed: uploadDoctorInfo,
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
