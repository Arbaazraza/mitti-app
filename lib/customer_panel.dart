import 'package:Mitti_the_app/view_product_json.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class CustomerPanel extends StatefulWidget {
  const CustomerPanel({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CustomerPanel> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CustomerPanel> {
  String s = '';
  _making_Phone_Call() async {
    String url = 'tel:' + s;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
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
              backgroundColor: Colors.white,
              child: Image.asset("assets/images/img1.png"),
            )),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                s =9369414069.toString();
              }
              );
              _making_Phone_Call();},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert), onPressed: () {  },
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
              const SizedBox(height: 15.0,),

              const SizedBox(height: 20.0,
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
                        const Text("Plates")
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
                        const Text("Flower Pot")
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
                        const Text("Pitcher")
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
                        const Text("Bowls")
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
                        const Text("Cups")
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 100.0,
                child: Card(
                  color: Colors.white,
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
                                    builder: (context) => const ViewProduct(title: 'View Products')),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.list_alt_rounded, size: 40, color: Color(0xffc9976b),),
                                Text("List Of", style: TextStyle(color: Color(0xffc9976b),fontWeight: FontWeight.bold
                                ),
                                ),
                                Text("Products", style: TextStyle(color: Color(0xffc9976b),fontWeight: FontWeight.bold),),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 120.0,),
              Card(
                color: const Color(0xffc9976b),
                child: SizedBox(
                  height: 405,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(
                            Icons.factory,color: Colors.white,
                          ),
                          title:Text(
                            '    MITTI:THE POTTERY APP',
                            style:
                            TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Pottery Services",
                          style:
                          TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'Contact',
                          style:
                          TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        ListTile(leading: Icon(Icons.email,color: Colors.white,),title:
                        Text("arbaazraza65@gmail.com",style: TextStyle(color: Colors.white),)),
                        ListTile(leading: Icon(Icons.email,color: Colors.white,),title:
                        Text("Abushahma@gmail.com",style: TextStyle(color: Colors.white),)),
                        ListTile(leading: Icon(Icons.email,color: Colors.white,),title:
                        Text("razaashhar2002@gmail.com",style: TextStyle(color: Colors.white),)),
                        ListTile(leading: Icon(Icons.email,color: Colors.white,),title:
                        Text("amarveersingh@gmail.com",style: TextStyle(color: Colors.white),)),
                        ListTile(leading: Icon(Icons.copyright,color: Colors.white,),title:
                        Text("2021-2022 - Developed by Team26",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

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
