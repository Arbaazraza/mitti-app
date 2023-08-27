import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewSoldProduct extends StatefulWidget {
  const ViewSoldProduct({Key? key, required String title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ViewSoldProduct> {
  String? data;
  var sold_product;
  int itemsCounter = 0;
  int sum=0;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getSoldProduct();
    // getSoldProduct();
  }
  /// ***********************************/
  void getSoldProduct() async {
    http.Response response = await http.get(Uri.parse(
        "https://mittitheapp.000webhostapp.com/Mitti the app/get_sold_product.php"));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        sold_product = jsonDecode(
            data!)['data'];

        for(int x=0;x<sold_product.length;x++)
        {
          sum=sum+int.parse(sold_product!=null?sold_product[x]['price']:0);
        }
        print(sum);
        print(sold_product.length);
        print(sold_product); // just printed length of data
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
          title: const Text("List of Sold Products"),
          backgroundColor: const Color(0xffc9976b),
        ),
        body:
        Stack(children: [
          ListView.builder(
              itemCount: sold_product == null ? 0 : sold_product.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  elevation: 10.0,
                  child: SizedBox(
                    height: 185,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Product Name- ",
                            ),
                            Text(
                              sold_product[index]['product_name']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Customer Name- ",
                            ),
                            Text(
                              sold_product[index]['costumer_name']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const Text(
                              "Quantity- ",
                            ),
                            Text(
                              sold_product[index]['quantity']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Earnings- ",
                            ),

                            Text(

                              sold_product[index]['price']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Contact- ",
                            ),

                            Text(

                              sold_product[index]['contact']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const Text(
                              "Address- ",
                            ),

                            Text(

                              sold_product[index]['address']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const Text(
                              "Ordered Date- ",
                            ),

                            Text(

                              sold_product[index]['order_date']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 35.0,),

                      ],
                    ),
                  ),

                );

              }
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: 45.0,
                  color: const Color(0xffc9976b),
                  // color: Colors.red,
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Product Sold = ",style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
                      Text( sold_product==null?"0":sold_product.length.toString(),style: const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                      const SizedBox(width: 5.0,),
                      Text("  Total Margin Earned = $sum Rs",style: const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 40.0,),
                    ],
                  )),
            ],
          )
        ],)
    );
  }
}
