import 'package:flutter/material.dart';
import 'package:wedplan/views/home/data_list_image/list_images.dart';

class AllImageCake extends StatefulWidget {
  const AllImageCake({Key? key}) : super(key: key);

  @override
  State<AllImageCake> createState() => _AllImageCakeState();
}

class _AllImageCakeState extends State<AllImageCake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: imgCake.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(8),
              width: 150,
              child: Image.network(
                imgCake[index],
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
