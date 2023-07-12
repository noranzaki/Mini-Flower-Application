import 'package:flutter/material.dart';
import 'package:mini_flower_application/presentation_layer/screens/flower_details.dart';
import 'package:mini_flower_application/presentation_layer/widgets/flower_price.dart';

import '../../data_layer/flowers.dart';

class FlowersPage extends StatefulWidget {
  const FlowersPage({Key? key}) : super(key: key);

  @override
  State<FlowersPage> createState() => _FlowersPageState();
}

class _FlowersPageState extends State<FlowersPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: ListTile(
                  title: Text(
                    "Good Morning!",
                    style: TextStyle(color: Color(0xFF757575), fontSize: 14),
                  ),
                  subtitle: Text(
                    "Flowers items",
                    style: TextStyle(color: Color(0xFF757575), fontSize: 19),
                  ),
                  trailing: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Sunflower1.png"),
                    backgroundColor: Colors.transparent,
                    radius: 25.0,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width*0.02,vertical: size.height*0.012),
                child: GridView.count(
                  childAspectRatio: (2 / 2.5),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 25,
                  children: List.generate(
                    8,
                    (index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FlowerDetails(index: index))),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(
                                bottom:size.height*0.03, top: size.height*0.009,right: size.width*0.04,left: size.width*0.04),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                    child: Center(
                                        child: Image.asset(
                                  "${flower[index].image}",
                                ))),
                                Text(
                                  "${flower[index].title}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                const Text(
                                  "Flower",
                                  style: TextStyle(color: Color(0xFF757575)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlowerPrice(price: flower[index].price!),
                                    SizedBox(
                                      width: size.width * 0.07,
                                      height: size.height*0.032,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
