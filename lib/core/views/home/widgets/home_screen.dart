import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_device_home_screen/common/components/app_components.dart';

import '../../../../utils/constants/assets_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*------------------------>
  *-------> variables
  <-------------------------*/
  var moduleList = [
    {
      "name": "Smart AC",
      "image": AssetsConst.imgAirCondition,
      "active": false,
    },
    {
      "name": "Smart Fan",
      "image": AssetsConst.imgFan,
      "active": false,
    },
    {
      "name": "Smart Light",
      "image": AssetsConst.imgBulb,
      "active": false,
    },
    {
      "name": "Smart TV",
      "image": AssetsConst.imgSmartTv,
      "active": false,
    },
  ];

  /*------------------------>
  *-------> builder
  <-------------------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 10),
            /*------------------------>
            *-------> top label area
            <-------------------------*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AssetsConst.imgMenu,
                    height: 25,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.person_alt,
                    size: 25,
                  ),
                ),
              ],
            ),
            /*------------------------>
            *-------> hero section
            *-------> name & welcome message
            <-------------------------*/
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                  ),
                  Text(
                    "Monirul Islam",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            /*------------------------>
            *-------> label
            <-------------------------*/
            const Text(
              "Smart Devices",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            /*------------------------>
            *-------> smart items
            <-------------------------*/
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: moduleList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                final item = moduleList[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: item["active"] == true ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        item["image"].toString(),
                        color: item["active"] == false
                            ? Colors.white
                            : Colors.black,
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item["name"].toString(),
                        style: TextStyle(
                          color: item["active"] == false
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          /*------------------------>
                          *-------> item description
                          <-------------------------*/
                          Expanded(
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 11,
                                color: item["active"] == false
                                    ? Colors.white60
                                    : Colors.black54,
                              ),
                            ),
                          ),
                          /*------------------------>
                          *-------> item switch
                          <-------------------------*/
                          Transform.rotate(
                            angle: pi / 2,
                            child: CupertinoSwitch(
                              onChanged: (value) {
                                setState(() {
                                  item["active"] = value;
                                });
                              },
                              value: item["active"] as bool,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            const Center(
                child: Text("This App Designed Only For Practice Purpose")),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
