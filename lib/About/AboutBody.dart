import 'package:flutter/material.dart';
import 'package:flutter_final_build/screens/utils/constants.dart';

import '../size_config.dart';

class AboutBody extends StatefulWidget {
const  AboutBody({Key? key}) : super(key: key);

  @override
  _AboutBodyState createState() => _AboutBodyState();
}

class _AboutBodyState extends State<AboutBody> {
   TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: MySize.size100 * 1.6,
                // decoration: BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            top: 10.0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: MySize.size100 * 2.9,
                                // height: MySize.size10,
                                child: customTextField(
                                 _dateController,
                                  "Enter date",
                                  "Choose Date",
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // _selectDate(context);
                                },
                                icon: const Icon(Icons.accessibility_sharp),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.only(
                            left: 10.0,
                            top: 10.0,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MySize.size100 * 2.9,
                                // height: MySize.size10,
                                child: customTextField(
                                  _timeController,
                                  "Enter Time",
                                  "Email",
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // _selectTime(context);
                                },
                                icon: const Icon(Icons.email),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                height: MySize.size100 * 1.6,
                // decoration: BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          top: 10.0,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MySize.size100 * 2.9,
                              // height: MySize.size10,
                              child: customTextField(
                               subjectController,
                                // subjectController,
                                "Enter Password",
                                "Enter Password",
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.password),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:const  EdgeInsets.only(
                          left: 10.0,
                          top: 10.0,
                        ),
                        child: Row(
                          children: [
                             Container(
                              width: MySize.size100 * 2.9,
                              // height: MySize.size10,
                              child: customTextField(
                               discriptionController,
                                "Enter New Password",
                                "Enter New Password",
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.vpn_key_outlined),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.black,
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                   kPrimaryColor,
                  ),
                ),
                onPressed: () {
                  // if (widget.data == null) {
                  //   postData();
                  // } else {
                  //   postUpdateData();
                  // }
                },
                icon:  const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                label: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          
        );
  }
}

  Widget customTextField(
    controller,
    hintText,
    labelText,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//            fillColor: themeData.colorScheme.background,
            hintStyle: const TextStyle(
              // color: themeData.colorScheme.onBackground,
            ),
            filled: true,
            hintText: hintText,
            labelText: labelText,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            // prefixIcon: Icon(Icons.person),
          ),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 7,
        )
      ],
    );
  }