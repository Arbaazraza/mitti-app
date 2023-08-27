import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'alert_box.dart';
import 'home_page.dart';



class AddProduct extends StatefulWidget {
  const AddProduct({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AddProduct> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddProduct> {
  ImagePicker picker = ImagePicker();
  XFile? uploadimage;
  bool isLoading = false;

  TextEditingController product_name=TextEditingController();
  TextEditingController product_mrp=TextEditingController();
  TextEditingController description=TextEditingController();

  Future<void> uploadInventoryInfo() async {

    if (
    product_mrp.text.isNotEmpty &&
        description.text.isNotEmpty &&
        product_name.text.isNotEmpty
    ) {
      setState(() {
        isLoading = true;
      });
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://mittitheapp.000webhostapp.com/Mitti the app/add_product.php"));

      request.files
          .add(await http.MultipartFile.fromPath('image', uploadimage!.path)
      );

      request.fields["product_name"] = product_name.text;
      request.fields["product_mrp"] = product_mrp.text;
      request.fields["description"] = description.text;


      var res = await request.send();

      if (res.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        product_name.clear();
        product_mrp.clear();
        description.clear();
        uploadimage=null;
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
        leading: IconButton(
            onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const MyHomePage(title: 'Home Page')),
            );}, icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xffc9976b),
        title: const Text("Add Product"),
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
                          controller: product_name,
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
                                  child:Icon(Icons.production_quantity_limits,color: Colors.white,)
                              ),
                              hintText: 'Product Name',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                      ),
                    ),    SizedBox(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: TextFormField(
                          controller: product_mrp,
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
                                  child:Icon(Icons.money,color: Colors.white,)
                              ),
                              hintText: 'Product MRP',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white)),
                        ),
                      ),
                    ),    SizedBox(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xffc9976b),
                        child: TextFormField(
                          controller: description,
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
                                  child:Icon(Icons.description,color: Colors.white,)
                              ),
                              hintText: 'Description',
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
                        onPressed: uploadInventoryInfo,
                        child: const Text(
                          'Add Product',
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
