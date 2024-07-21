import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/ahadeeth_model.dart';
import '../../ahadeeth_details.dart';

class AhadeethTab extends StatefulWidget {
  AhadeethTab({super.key});

  @override
  State<AhadeethTab> createState() => _AhadeethTabState();
}

class _AhadeethTabState extends State<AhadeethTab> {
  List<HadeethModel> allAhadeth = [];

  @override
  void initState() { /////////////////////////////////////////////////
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    // if(allAhadeth.isEmpty){
    //   loadHadethFile();
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/allah.png",
          height: 219,
        ),
        const Divider(),
        Text(
          'ahadeth'.tr(),
          textAlign: TextAlign.center,
          style: GoogleFonts.elMessiri(
            fontSize: 25,
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) =>const Divider(
              thickness: 1,
              endIndent: 40,
              indent: 40,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AhadeethDetails.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> ahadeth = value.split("#");

      for (int i = 0; i < ahadeth.length; i++) {
        String hadeth = ahadeth[i];

        List<String> hadethLines = hadeth.trim().split("\n");

        String title = hadethLines[0];

        hadethLines.removeAt(0);

        List<String> content = hadethLines;
        HadeethModel hadethModel = HadeethModel(title, content);

        print(title);
        allAhadeth.add(hadethModel);
        setState(() {});
      }
    });
  }
}