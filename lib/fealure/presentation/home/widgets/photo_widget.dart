import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    Key? key,
    required this.toCatalog,
    required this.image,
  }) : super(key: key);

  final Function toCatalog;
  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image.title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () => toCatalog(),
        ),
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image.urlImage),
                    fit: BoxFit.fill)),
          ),
          ],
        ),
      ),
    );
  }
}
