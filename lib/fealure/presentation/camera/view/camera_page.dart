
import 'package:clean_line/core/core.dart' as core_widgets;
import 'package:clean_line/servise_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/index.dart';
import '../widgets/index_widget.dart';


class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<CameraController, CameraState>(
        builder: (context, state) {
          return state.when(
            initial: () => const core_widgets.LoadWidget(),
            photo: (image) => IndexWidget(
               image: image,
              toBack: () => BlocProvider.of<CameraController>(context).toBack(),
              getImage: (imageSource) => BlocProvider.of<CameraController>(context).getImage(imageSource: imageSource ),
              cropImage: () => BlocProvider.of<CameraController>(context).imageCropper(),
              delImage: () => BlocProvider.of<CameraController>(context).delImage(),
              saveImag: () => BlocProvider.of<CameraController>(context).sendImage(),
            ),
            loading: () => const core_widgets.LoadWidget(),
            empty: () => const core_widgets.LoadWidget(),
            error: (failure) => core_widgets.ErrorWidget(failure.message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraController>(
      create: (context) => sl<CameraController>()..init(),
      child: _buildBody(context),
    );
  }
}

