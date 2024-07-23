import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;
  int index = 0;
  List<String> Azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
  ];
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(pro.appTheme == ThemeMode.light? "assets/images/head of seb7a.png" : "assets/images/head of seb7a dark.png",),
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Transform.rotate(
                angle: angle,
                child: GestureDetector(
                    onTap: () {
                      whenPressing();
                    },
                    child: Image.asset(pro.appTheme==ThemeMode.light?"assets/images/body of seb7a.png":"assets/images/body of seb7a dark.png",height: 234,)),
              ),
            ),
          ],
        ),
         Padding(
          padding: const EdgeInsets.only(top: 27.0),
          child: Text(
            "number_tasbeeh".tr(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding:const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: pro.appTheme == ThemeMode.light?Theme.of(context).primaryColor : Color(0xFF141A2E),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text("$counter"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: pro.appTheme == ThemeMode.light?Theme.of(context).primaryColor : AppColors.yellowColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(Azkar[index],style: TextStyle(color: Colors.black),),
            ),
          ),
        ),
      ],
    );
  }

  whenPressing() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter++;
      counter = 0;
    }
    if (index == Azkar.length) {
      index = 0;
    }
    angle += 360 / 4;
    setState(() {});
  }
}