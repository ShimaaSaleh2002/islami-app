import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ahadeeth_model.dart';

class AhadeethDetails extends StatelessWidget {
  static const String routeName = 'ahadeethDatails';
  const AhadeethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadeethModel;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg3.png'),fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              model.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'el-mesirri'),
            ),
            centerTitle: true,
          ),
          body: Card(
            color: const Color(0xCBB7935F),
            margin: const EdgeInsets.all(12),
            elevation: 4,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.transparent)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    model.content[index],
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inder(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                  );
                },
                itemCount: model.content.length,
              ),
            ),
          ),
        ));
  }
}
