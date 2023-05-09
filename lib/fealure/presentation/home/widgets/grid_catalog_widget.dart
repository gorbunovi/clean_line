import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:flutter/material.dart';

class GridCatalogWidget extends StatelessWidget{

  GridCatalogWidget({
    required this.imagesList,
    required this.toPhoto,
  });

  final List<ImageModel> imagesList;
  final Function toPhoto;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imagesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () => toPhoto(imagesList[index]),
            child: Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imagesList[index].urlImage),
                      fit: BoxFit.fill)),
            ),
          );
        });
  }



}