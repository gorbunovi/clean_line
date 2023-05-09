import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:clean_line/fealure/presentation/home/widgets/grid_catalog_widget.dart';
import 'package:flutter/material.dart';

class IndexHomeWidget extends StatelessWidget {
  const IndexHomeWidget({
    Key? key,
    required this.addPhoto,
    required this.toPhoto,
    this.imagesList,
  }) : super(key: key);

  final Function addPhoto;
  final Function toPhoto;
  final List<ImageModel>? imagesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: imagesList?.length == 0
              ? const Text('В каталоге нет рисунков')
              : GridCatalogWidget(imagesList: imagesList ?? [], toPhoto: toPhoto),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => addPhoto(),
        label: const Icon(Icons.add),
      ),
    );
  }
}
