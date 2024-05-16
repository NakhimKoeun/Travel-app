import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/widget/Appbuttom.dart';
import 'package:travelapp/widget/respunsuve.dart';
import 'package:travelapp/widget/text_larng.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int getStart = 5;
  int selectIndex = 5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitSates>(builder: (context, state) {
      DetailSate detail = state as DetailSate;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 450,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/${detail.place.img}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 70,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: Icon(Icons.menu, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 400,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 400,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      detail.place.name,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                    ),
                                    Text(
                                      "\$${detail.place.price}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(Icons.location_on),
                                    SizedBox(width: 5),
                                    Text(
                                      detail.place.location,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Wrap(
                                      children: List.generate(5, (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              getStart = index + 1;
                                            });
                                          },
                                          child: Icon(
                                            Icons.star,
                                            color: index < detail.place.stars
                                                ? Colors.yellow
                                                : Colors.grey,
                                          ),
                                        );
                                      }),
                                    ),
                                    SizedBox(width: 5),
                                    const Text(
                                      "(5.0)",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "People",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Number of people in group",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: AppBottom(
                                          color: selectIndex == index
                                              ? Colors.grey
                                              : Colors.black,
                                          backgroundColor: selectIndex == index
                                              ? Colors.black
                                              : Colors.grey,
                                          borderColor: selectIndex == index
                                              ? Colors.black
                                              : Colors.grey,
                                          size: 50,
                                          text: (index + 1).toString(),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(height: 10),
                                text_larng(
                                  text: "Description",
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  detail.place.description,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    AppBottom(
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                      borderColor: Colors.grey,
                                      size: 50,
                                      Isicon: true,
                                      icon: Icons.favorite_border_outlined,
                                    ),
                                    SizedBox(width: 10),
                                    const ResponSive(
                                      isResponSive: true,
                                      color: Colors.black,
                                      iconColor: Colors.white,
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
