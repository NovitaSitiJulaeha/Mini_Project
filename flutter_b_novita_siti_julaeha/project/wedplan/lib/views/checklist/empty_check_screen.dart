import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCheckScreen extends StatefulWidget {
  const EmptyCheckScreen({Key? key}) : super(key: key);

  @override
  State<EmptyCheckScreen> createState() => _EmptyCheckScreenState();
}

class _EmptyCheckScreenState extends State<EmptyCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              'assets/checklist.png',
            ),
            height: 250,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'the checklist is still empty...',
            style: GoogleFonts.satisfy(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
