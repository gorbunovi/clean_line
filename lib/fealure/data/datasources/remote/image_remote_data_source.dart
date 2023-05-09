import 'dart:convert';
import 'dart:io';
import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:http/http.dart' as http;

abstract class ImageRemoteDataSourse{
  Future<ImageModel?> uploadRemoteImage(File image);
  Future<void> deleteRemoteImage(ImageModel image);
}

class ImageRemoteDataSourseImpl implements ImageRemoteDataSourse{


  ImageRemoteDataSourseImpl();

  @override
  Future<ImageModel?> uploadRemoteImage(File image) async{
    var request = http.MultipartRequest("POST",Uri.parse("https://api.imgur.com/3/image"));
    request.fields['title'] = "dummyImage";
    request.fields['description'] = "descriptionImage";
    request.headers['Authorization'] = "Client-ID "+"0d362d06768359b";
    var bytes = image.readAsBytesSync();
    var picture = http.MultipartFile.fromBytes(
        'image',
        bytes.buffer.asUint8List(),
        filename: image.path);
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = json.decode(String.fromCharCodes(responseData));
    print(result);
    print(result['data']);
    // print(result['data']['status']);
    if (result ['success'] == true && result ['status'] == 200) {
      print(result);
      return ImageModel(
        id: result ['data']['id'],
        title: result ['data']['title'],
        description: result ['data']['description'],
        deletehash: result ['data']['deletehash'],
        urlImage: result ['data']['link'],
      );
    }else{
      return null;
    }
  }

  @override
  Future<void> deleteRemoteImage(ImageModel image) async{

    Map data = {
      "data": true,
      "success": true,
      "statuc": 200
    };

    var request = await http.delete(
      Uri.parse('"https://api.imgur.com/3/image/${image.deletehash}"'),
      body: {
        "data": true,
        "success": true,
        "statuc": 200
      },
    );

  }
  
}