import 'dart:async';

import 'package:Mitti_the_app/Circle.dart';

import 'add_material.dart';
import 'add_product.dart';
import 'add_employee.dart';
import 'PreparedProduct.dart';
import 'raw_product.dart';
import 'product_sold_to.dart';
import 'upload_inventory.dart';
import 'upload_material.dart';
import 'view_employees.dart';
import 'view_list_of_customer.dart';
import 'view_product_json.dart';
import 'view_sold_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Expenses.dart';
import 'add_customer.dart';
import 'MaterialRequirement.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffc9976b),
        // title: Text('AppBar'),
        leading: IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              child: Image.asset("assets/images/img1.png"),
              backgroundColor: Colors.white,
            )),
        actions: [
          // IconButton(
          //   onPressed: () {
          //
          //   },
          //   icon: const Icon(Icons.call),
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .02,
          ),
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  //1st Image of Slider
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //2nd Image of Slider
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img4.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img5.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                //Slider Container properties
                options: CarouselOptions(
                  height: 150.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1.0,
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 90.0,
                child: Card(
                  color: const Color(0xffc9976b),
                  elevation: 5,
                  child: Row(
                    // spacing: ,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewSoldProduct(title: 'View Sold Products')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.bookmark, size: 30, color: Colors.white,),
                                Text("Sold", style: TextStyle(color: Colors.white),),
                                Text("Products", style: TextStyle(color: Colors.white),)
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PreparedProduct(title: 'Prepared Products')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.verified_user, size: 30, color: Colors.white,),
                                Text("Prepared", style: TextStyle(color: Colors.white),),
                                Text("Products", style: TextStyle(color: Colors.white),)
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddProduct(title: 'Add Product')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.add_shopping_cart_rounded ,size: 30, color: Colors.white,),
                                Text("Add", style: TextStyle(color: Colors.white),),
                                Text("Product", style: TextStyle(color: Colors.white),)
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewProduct(title: 'View Products')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.list_alt_rounded, size: 30, color: Colors.white,),
                                Text("View", style: TextStyle(color: Colors.white),),
                                Text("Products", style: TextStyle(color: Colors.white),),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 90.0,
                child: Card(
                  color: const Color(0xffc9976b),
                  elevation: 5,
                  child: Row(
                    // spacing: ,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SoldOrder(title: 'Sell Product')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.shopping_bag_sharp, size: 30, color: Colors.white,),
                                Text("Product", style: TextStyle(color: Colors.white),),
                                Text("Sold To", style: TextStyle(color: Colors.white),),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RawProduct(title: 'Raw Product')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.raw_off_rounded, size: 30, color: Colors.white,),
                                Text("Raw", style: TextStyle(color: Colors.white),),
                                Text("Product", style: TextStyle(color: Colors.white),)
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewCustomer(title: 'Customer List')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.admin_panel_settings_outlined, size: 30, color: Colors.white,),
                                Text("Customer", style: TextStyle(color: Colors.white),),
                                Text("List", style: TextStyle(color: Colors.white),)
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddCustomer(title: 'Expenses')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.person_add ,size: 30, color: Colors.white,),
                                Text("Add", style: TextStyle(color: Colors.white),),
                                Text("Customer", style: TextStyle(color: Colors.white),)
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 90.0,
                child: Card(
                  color: const Color(0xffc9976b),
                  elevation: 5,
                  child: SingleChildScrollView(
                    child: Row(
                      // spacing: ,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Circle(title: 'Circle')),
                                );
                              },
                              child: Column(
                                children: const [
                                  Icon(Icons.batch_prediction, size: 30, color: Colors.white,),
                                  Text("Material", style: TextStyle(color: Colors.white),),
                                  Text("Prediction", style: TextStyle(color: Colors.white),),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddMaterial(title: 'Add Material')),
                                );
                              },
                              child: Column(
                                children: const [
                                  Icon(Icons.add_box_outlined, size: 30, color: Colors.white,),
                                  Text("Add", style: TextStyle(color: Colors.white),),
                                  Text("Material", style: TextStyle(color: Colors.white),)
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const UploadMaterial(title: 'Upload Material')),
                                );
                              },
                              child: Column(
                                children: const [
                                  Icon(Icons.hub, size: 30, color: Colors.white,),
                                  Text("Upload", style: TextStyle(color: Colors.white),),
                                  Text("Material", style: TextStyle(color: Colors.white),)
                                ],
                              )),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 8),
                        //   child: GestureDetector(
                        //       onTap: () {
                        //         // Navigator.push(
                        //         //   context,
                        //         //   MaterialPageRoute(
                        //         //       builder: (context) => const ViewProduct(title: 'View Product)),
                        //         // );
                        //       },
                        //       child: Column(
                        //         children: const [
                        //           Icon(Icons.list_alt_rounded,size: 30, color: Colors.white,),
                        //           Text("View", style: TextStyle(color: Colors.white),),
                        //           Text("Material", style: TextStyle(color: Colors.white),)
                        //         ],
                        //       )
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90.0,
                child: Card(
                  color: const Color(0xffc9976b),
                  elevation: 5,
                  child: Row(
                    // spacing: ,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewEmployees(title: 'Employee List')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.admin_panel_settings, size: 30, color: Colors.white,),
                                Text("Employee", style: TextStyle(color: Colors.white),),
                                Text("List", style: TextStyle(color: Colors.white),),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddEmployee(title: 'Add Employee')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.add_moderator, size: 30, color: Colors.white,),
                                Text("Add", style: TextStyle(color: Colors.white),),
                                Text("Employee", style: TextStyle(color: Colors.white),)
                              ],
                            )),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 5),
                      //   child: GestureDetector(
                      //       onTap: () {
                      //         // Navigator.push(
                      //         //   context,
                      //         //   MaterialPageRoute(
                      //         //       builder: (context) => const ViewEmployees(title: 'Change Batch Status')),
                      //         // );
                      //       },
                      //       child: Column(
                      //         children: const [
                      //           Icon(Icons.pending_actions_outlined, size: 30, color: Colors.white,),
                      //           Text("Upload", style: TextStyle(color: Colors.white),),
                      //           Text("Attendance", style: TextStyle(color: Colors.white),)
                      //         ],
                      //       )),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Expenses(title: 'Expenses')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.menu_book, size: 30, color: Colors.white,),
                                Text("Daily Basis", style: TextStyle(color: Colors.white),),
                                Text("Expenses", style: TextStyle(color: Colors.white),),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 90.0,
              //   child: Card(
              //     color: const Color(0xffc9976b),
              //     elevation: 5,
              //     child: Row(
              //       // spacing: ,
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //
              //         Padding(
              //           padding: const EdgeInsets.only(top: 8.0),
              //           child: GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => const RawProduct(title: 'Raw Product')),
              //                 );
              //               },
              //               child: Column(
              //                 children: const [
              //                   Icon(Icons.content_copy_rounded, size: 30, color: Colors.white,),
              //                   Text("View", style: TextStyle(color: Colors.white),),
              //                   Text("Summary", style: TextStyle(color: Colors.white),)
              //                 ],
              //               )),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(top: 5.0),
              //           child: GestureDetector(
              //               onTap: () {
              //                 // Navigator.push(
              //                 //   context,
              //                 //   MaterialPageRoute(
              //                 //       builder: (context) => const ViewSoldProduct(title: 'Order City List')),
              //                 // );
              //               },
              //               child: Column(
              //                 children: const [
              //                   Icon(Icons.location_pin, size: 30, color: Colors.white,),
              //                   Text("Ordered", style: TextStyle(color: Colors.white),),
              //                   Text("City List", style: TextStyle(color: Colors.white),),
              //                 ],
              //               )),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              const SizedBox(height: 25.0,
                child: Text("-------------------------------------------------------------------",style: TextStyle(
                  color: Color(0xffc9976b),
                ),),
              ),
              const Text("Featured",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              const SizedBox(height: 10.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/plates.jpg'),
                                fit: BoxFit.fill
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        const Text("Plates",style: TextStyle(fontWeight: FontWeight.w300),)
                      ],
                    ),
                  const SizedBox(width: 10.0,),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/flowerpot.jpg'),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text("Flower Pot",style: TextStyle(fontWeight: FontWeight.w300),)
                    ],
                  ),
                    const SizedBox(width: 10.0,),
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/pitcher.jpg'),
                                fit: BoxFit.fill
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        const Text("Pitcher",style: TextStyle(fontWeight: FontWeight.w300),)
                      ],
                    ),
                    const SizedBox(width: 10.0,),
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/bowl.jpg'),
                                fit: BoxFit.fill
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        const Text("Bowls",style: TextStyle(fontWeight: FontWeight.w300),)
                      ],
                    ),
                    const SizedBox(width: 10.0,),
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/cup.jpg'),
                                fit: BoxFit.fill
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        const Text("Cups",style: TextStyle(fontWeight: FontWeight.w300),)
                      ],
                    ),
                ],
                ),
              ),
              const SizedBox(height: 100.0,),
              Card(
                color: const Color(0xffc9976b),
                child: SizedBox(
                  height: 410,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(
                            Icons.factory,color: Colors.white,
                          ),
                          title:Text(
                            'MITTI:THE POTTERY APP      ',
                            style:
                            TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Pottery Services",
                          style:
                          TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          'Contact',
                          style:
                          TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        ListTile(leading: Icon(Icons.email,color: Colors.white,),title:
                        Text("arbaazraza65@gmail.com",style: TextStyle(color: Colors.white),)),
                        ListTile(leading: Icon(Icons.email,color: Colors.white,),title:
                        Text("razaashhar2002@gmail.com",style: TextStyle(color: Colors.white),)),
                        ListTile(leading: Icon(Icons.email,color: Colors.white,),title:
                        Text("abushahma@gmail.com",style: TextStyle(color: Colors.white),)),
                        ListTile(leading: Icon(Icons.email,color: Colors.white,),title:
                        Text("amarveersingh@gmail.com",style: TextStyle(color: Colors.white),)),
                        ListTile(leading: Icon(Icons.copyright,color: Colors.white,),title:
                        Text("2022-2023 - Developed by Team26",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
