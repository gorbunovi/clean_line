
import 'dart:convert';
import 'dart:io';

import 'package:clean_line/fealure/domain/usecases/upload_image.dart';
import 'package:clean_line/fealure/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'index.dart';

class CameraController extends Cubit<CameraState> {
  CameraController({required this.uploadImage}) : super(const Initial());

  final UploadImage uploadImage;
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> init() async{
    emit(Photo(image: _image));
  }


  Future<void> getImage({required ImageSource imageSource}) async {
    XFile? image = await _picker.pickImage(source: imageSource);
    if(image != null) _image = File(image!.path);
    emit(Photo(image: _image));
  }

  Future<void> imageCropper() async{
    if (_image != null){
      emit(const Loading());
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: _image!.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Редактирование',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Редактирование',
          ),
        ],
      );
      if (cropped != null) _image = File(cropped!.path);
      emit(Photo(image: _image));
    }
  }

  Future<void> delImage() async{
    _image = null;
    emit(Photo(image: _image));
  }

  Future<void> sendImage() async{
    if(_image != null){
      await uploadImage(_image!);
    }
    _image = null;
    emit(Photo(image: _image));
  }

  void toBack(){
    Get.offAllNamed(Routes.HOME);
  }


}
