import 'package:flutter/material.dart';
import 'package:wedplan/views/home/data_list_image/list_images.dart';

class AllImageDress extends StatefulWidget {
  const AllImageDress({Key? key}) : super(key: key);

  @override
  State<AllImageDress> createState() => _AllImageDressState();
}

class _AllImageDressState extends State<AllImageDress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17203A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: imgDress.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(8),
              width: 150,
              child: Image.network(
                imgDress[index],
                fit: BoxFit.cover,
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10),
        ),
      ),
    );
  }
}
