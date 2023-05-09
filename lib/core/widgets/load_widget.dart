import 'package:flutter/material.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            toolbarHeight: 50,
            title: const Text('Загрузка',
            ),
            centerTitle: true,
      ),
      body:  const SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xffE9DDC5),
          ),
        ),
      ),
    );
  }
}