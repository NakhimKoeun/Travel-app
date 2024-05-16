import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/Data/ListData.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/widget/respunsuve.dart';
import 'package:travelapp/widget/text_larng.dart';
import 'package:travelapp/widget/textapp.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: page.length, // Added comma here
        itemBuilder: (context, index) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(page[index].images),
                    fit: BoxFit.cover)),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text_larng(
                        text: "Trips",
                      ),
                      textapp(
                        text: page[index].title,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 250,
                          child: textapp(text: page[index].subtitle)),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                          width: 200,
                          child: Row(
                            children: [
                              ResponSive(
                                widget: 60,
                                height: 40,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                      children: List.generate(3, (indexDots) {
                    return Container(
                      width: 8,
                      height: index == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                    );
                  }))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
