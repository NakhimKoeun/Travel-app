import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Data/ListData.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/widget/CircleTabIndicator.dart';
import 'package:travelapp/widget/text_larng.dart';
import 'package:travelapp/widget/textapp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); // Fixed the key syntax

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tapController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AppCubits, CubitSates>(
          builder: (context, state) {
            if (state is LoadedSate) {
              var info = state.places;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70, left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.menu),
                        Expanded(child: Container()),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: text_larng(
                      // Assuming this is a custom widget for styled text
                      text: "Discover",
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: EdgeInsets.only(right: 30),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: _tapController,
                        indicator:
                            CircleTabIndicator(color: Colors.blue, radius: 4),
                        tabs: [
                          Text("Place"),
                          Text("Inspiration"),
                          Text("Emotions"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tapController,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: info.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .detaiPage(info[index]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/${info[index].img}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Text("hi"),
                        Text("nihou"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Explore More",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "See More",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: explore.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        explore[index]
                                            .images
                                            .toString(), // Convert to string
                                        height: 90,
                                        width: 60,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  explore[index]
                                      .text
                                      .toString(), // Convert to string
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
