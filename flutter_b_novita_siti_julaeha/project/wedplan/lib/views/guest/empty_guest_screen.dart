import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyGuestScreen extends StatefulWidget {
  const EmptyGuestScreen({Key? key}) : super(key: key);

  @override
  State<EmptyGuestScreen> createState() => _EmptyGuestScreenState();
}

class _EmptyGuestScreenState extends State<EmptyGuestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              'assets/guest.jpg',
            ),
            height: 250,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'the guest list is still empty...',
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
