import 'package:flutter/material.dart';
import 'package:flutter_practice/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCheck extends StatefulWidget {
  @override
  _MyCheckState createState() => _MyCheckState();
}

class _MyCheckState extends State<MyCheck> {
  List<CheckBoxState> notifications = [
    CheckBoxState(
      title: 'Murad Pagol',
      value: false,
    ),
    CheckBoxState(
      title: 'Bashar Pagol',
    ),
    CheckBoxState(title: 'Durjoy Pagol'),
    CheckBoxState(
      title: 'Suborna Pagol',
    ),
    CheckBoxState(
      title: 'Sanjida Pagol',
    ),
    CheckBoxState(
      title: 'Boro vaider niye kicu koilm na xD',
    ),
    CheckBoxState(
      title: 'Rabby Valo',
    ),
  ];
  final allnoti = CheckBoxState(
    title: 'রাব্বী বাদে সব পাগল , রাজি থাকলে টিক মার',
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SplashColor color = SplashColor();
    return SafeArea(
      child: Scaffold(
          backgroundColor: color.homeBackground,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                  child: Container(
                    height: size.height / 1.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        groupcheckBox(allnoti),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        ...notifications.map(checkBox).toList(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }

  Widget checkBox(CheckBoxState myCheckbox) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        myCheckbox.title,
        style: GoogleFonts.poppins(
          color: Colors.amber,
          fontSize: 20,
        ),
      ),
      activeColor: Colors.red,
      value: myCheckbox.value,
      onChanged: (bool value) {
        setState(() {
          myCheckbox.value = value;
          allnoti.value = notifications.every((element) => element.value);
        });
      },
    );
  }

  Widget groupcheckBox(CheckBoxState checkbox) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          checkbox.title,
          style: GoogleFonts.mina(
            color: Colors.amber,
            fontSize: 20,
          ),
        ),
        activeColor: Colors.red,
        value: checkbox.value,
        onChanged: (value) {
          setState(() {
            allnoti.value = value;
            notifications.forEach((element) => element.value = value);
          });
        });
  }
}

class CheckBoxState {
  String title;
  bool value;
  CheckBoxState({this.title, this.value = false});
}
