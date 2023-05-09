
import 'package:clean_line/core/core.dart' as core_widgets;
import 'package:clean_line/fealure/presentation/home/widgets/photo_widget.dart';
import 'package:clean_line/servise_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/index.dart';
import '../widgets/index_home_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () =>  const core_widgets.LoadWidget(),
            catalog: (imagesList) => IndexHomeWidget(
              imagesList: imagesList,
              addPhoto: () => BlocProvider.of<HomeController>(context).addPhoto(),
              toPhoto: (image) => BlocProvider.of<HomeController>(context).toImage(image: image),
            ),
            photo: (image) => PhotoWidget(
              image: image,
              toCatalog:() => BlocProvider.of<HomeController>(context).toCatalog(),
            ),
            loading: () => const core_widgets.LoadWidget(),
            empty: () => const core_widgets.LoadWidget(),
            error: (failure) => core_widgets.ErrorWidget(failure.message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeController>(
      create: (context) => sl<HomeController>()..init(),
      child: _buildBody(context),
    );
  }
}

