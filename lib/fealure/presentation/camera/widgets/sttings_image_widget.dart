import 'package:flutter/material.dart';

Widget SettingsImageWidget({required Function saveImag, required Function cropImage, required Function delImage}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
        ),
        onPressed: () => saveImag(),
        child: const Icon(Icons.send, color: Colors.black),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellowAccent,
        ),
        onPressed: () => cropImage(),
        child: const Icon(Icons.settings_suggest_outlined, color: Colors.black),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
        ),
        onPressed: () => delImage(),
        child: const Icon(Icons.delete_forever_outlined),
      ),
    ],
  );
}