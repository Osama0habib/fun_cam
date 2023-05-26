import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fun_cam/camera_app/presentation/manager/camera_bloc.dart';
import 'package:wakelock/wakelock.dart';

class CameraPreview extends StatelessWidget {
  const CameraPreview({Key? key,required this.state}) : super(key: key);
  final CameraState state;
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return state.controller != null && state.controller!.isInitialized
        ? Center(
      child: Transform.scale(scale: state.controller!.aspectRatio/deviceRatio ,
        child: AspectRatio(
          aspectRatio: state.controller!.aspectRatio,
          child: DeepArPreview(
            state.controller!,
          ),
        ),
      ),
    )
        : const Center(
      child: Text("Loading..."),
    );
  }
}
