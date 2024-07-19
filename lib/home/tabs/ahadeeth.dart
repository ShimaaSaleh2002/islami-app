import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ahadeeth_details.dart';
import '../../ahadeeth_model.dart';

class AhadeethTab extends StatefulWidget {
  AhadeethTab({super.key});

  @override
  State<AhadeethTab> createState() => _AhadeethTabState();
}

class _AhadeethTabState extends State<AhadeethTab> {
  List<HadeethModel> allAhadeeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeeth.isEmpty) {
      loadAhadeethFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
          image: AssetImage('assets/images/allah.png'),
          height: 219,
        ),
        const Divider(
          thickness: 3,
          color: Color(0xFFB7935F),
        ),
        const Text(
          'الأحاديث',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'el-mesirri',
              fontSize: 25),
          textAlign: TextAlign.center,
        ),
        const Divider(
          thickness: 3,
          color: Color(0xFFB7935F),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap : (){
                  Navigator.pushNamed(context, AhadeethDetails.routeName,
                      arguments: allAhadeeth[index]);
                },
                  child :Text(
                allAhadeeth[index].title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inder(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 25)),
              ));
            },
            itemCount: allAhadeeth.length,
          ),
        )
      ],
    );
  }

  loadAhadeethFile() async {
    String ahadeethFile =
        await rootBundle.loadString('assets/files/ahadeth.txt');

    List<String> ahadeeth = ahadeethFile.trim().split('#');
    for (int i = 0; i < ahadeeth.length; ++i) {
      String hadeeth = ahadeeth[i];
      List<String> hadeethLines = hadeeth.trim().split('\n');
      String title = hadeethLines[0];
      hadeethLines.removeAt(0);
      List<String> content = hadeethLines;

      HadeethModel hadeethModel = HadeethModel(title, content);
      allAhadeeth.add(hadeethModel);
    }
    setState(() {});
  }
}
