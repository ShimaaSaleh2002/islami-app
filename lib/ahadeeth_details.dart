import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/ahadeeth_model.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class AhadeethDetails extends StatelessWidget {
  static const String routeName = "HadethScreen";

  const AhadeethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as HadeethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(pro.appTheme == ThemeMode.light
              ? "assets/images/bg3.png"
              : "assets/images/bgdark.png"),
          fit: BoxFit.fill,
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
