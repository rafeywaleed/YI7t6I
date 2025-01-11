import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'initial_page.dart';

void main() {
  runApp(const UbixstarAsgn());
}

class UbixstarAsgn extends StatelessWidget {
  const UbixstarAsgn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InitialPage(),
    );
  }
}
