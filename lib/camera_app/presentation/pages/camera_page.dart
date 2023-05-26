import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fun_cam/camera_app/presentation/manager/camera_bloc.dart';
import 'package:fun_cam/camera_app/presentation/widgets/camera_perview.dart';
import 'package:fun_cam/camera_app/presentation/widgets/filters_widget.dart';
import 'package:fun_cam/camera_app/presentation/widgets/flash_button.dart';
import 'package:fun_cam/camera_app/presentation/widgets/footer_widget.dart';
import 'package:fun_cam/core/utils/app_constant.dart';
import 'package:fun_cam/core/utils/enums.dart';
import 'package:deepar_flutter/src/deep_ar_controller.dart';
import '../../../core/services/service_locator.dart';
import '../widgets/material_circle_widget.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraBloc(sl(), sl(), sl())
        ..add(InitializeControllerEvent())
        ..add(GetFiltersFromAssetsEvent())
        ..add(GetEffectsFromAssetsEvent())
        ..add(GetMasksFromAssetsEvent()),
      child: BlocBuilder<CameraBloc, CameraState>(
        builder: (context, state) {
          print("camera index :${state.controller?.cameraDirection.name}");
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: const Text(AppConstant.appName),
              centerTitle: true,

              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            body: Stack(
              children: [
                CameraPreview(state: state),
                Align(
                  alignment: Alignment.topRight,
                  child: FlashButton(state: state,)
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: FiltersWidget(
                    state: state,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FooterWidget(
                    state: state,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
