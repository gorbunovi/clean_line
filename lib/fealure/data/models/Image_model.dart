import 'package:clean_line/fealure/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity{

    ImageModel({
      required String id,
      required String title,
      required String description,
      required String deletehash,
      required String urlImage,
  }): super(
      id: id,
      title: title,
      description: description,
      deletehash: deletehash,
      urlImage: urlImage,
    );

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        deletehash: json['deletehash'],
        urlImage: json['urlImage'],
    );

    Map<String, dynamic> toJson(){
      return {
        'id': id,
        'title': title,
        'description': description,
        'deletehash': deletehash,
        'urlImage': urlImage,
      };
    }

    @override
  String toString() {
    return 'ImageModel{'
      'id: $id, '
      'title: $title, '
      'description: $description, '
      'deletehash: $deletehash, '
      'urlImage: $urlImage,'
        '}';
  }
}