import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'suraDetails';
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFiles(model.index);
    }
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg3.png'),fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              model.name,
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
                    '${verses[index]}(${index+1})',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inder(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
                  );
                },
                itemCount: verses.length,
              ),
            ),
          ),
        ));
  }

  loadSuraFiles(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');

    List<String> suraLines = sura.split('\n');
    verses = suraLines;
    setState(() {});
  }
}
