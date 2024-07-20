import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/ahadeeth_model.dart';

class AhadeethDetails extends StatelessWidget {
  static const String routeName = "HadethScreen";

  const AhadeethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadeethModel;
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/main_bg.png"),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    model.content[index],
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.elMessiri(
                      fontSize: 25,
                    ),
                  ),
                );
              },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );
  }
}