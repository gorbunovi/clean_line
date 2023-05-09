import 'dart:io';

import 'package:flutter/material.dart';

import 'get_image_widget.dart';
import 'show_image_widget.dart';
import 'sttings_image_widget.dart';

class IndexWidget extends StatelessWidget {
  const IndexWidget({
    Key? key,
    required this.getImage,
    required this.cropImage,
    required this.delImage,
    required this.saveImag,
    required this.toBack,
    required this.image,
  }) : super(key: key);

  final Function getImage;
  final Function cropImage;
  final Function delImage;
  final Function saveImag;
  final Function toBack;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Изображение'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => toBack(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowImageWidget(image),
            const SizedBox(height: 20,),
            image == null? GetImageWigdget(getImage: getImage)
                : SettingsImageWidget(
              cropImage: cropImage,
              delImage: delImage,
              saveImag: saveImag,
            ),
          ],
        ),
      ),
    );
  }
}
