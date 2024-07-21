import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset("assets/images/head of seb7a.png",),
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Transform.rotate(
                angle: angle,
                child: GestureDetector(
                    onTap: () {
                      whenPressing();
                    },
                    child: Image.asset("assets/images/body of seb7a.png",height: 234,)),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 27.0),
          child: Text(
            "عدد التسبيحات",
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding:const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(Azkar[index]),
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