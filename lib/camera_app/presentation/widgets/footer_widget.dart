import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_cam/camera_app/presentation/widgets/material_circle_widget.dart';
import 'package:fun_cam/core/utils/enums.dart';

import '../manager/camera_bloc.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key, required this.state}) : super(key: key);
  final CameraState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        children: [
          Expanded(
              child: IconButton(
                  style: IconButton.styleFrom(
                    side: const BorderSide(color: Colors.amberAccent,width: 1.5),
                    shape: const CircleBorder(),
                    foregroundColor: Colors.amberAccent
                  ),
                  onPressed: () {
                    context.read<CameraBloc>().add(FlipCameraEvent());
                  },
                  icon: const Icon(Icons.flip_camera_ios_outlined))),
          if (state.captureState == CaptureState.photo)
            Expanded(
                child: IconButton(
                    style: IconButton.styleFrom(
                        side: const BorderSide(color: Colors.amberAccent,width: 1.5),
                        shape: const CircleBorder(),
                        foregroundColor: Colors.amberAccent
                    ),
                    onPressed: () {
                      context.read<CameraBloc>().add(TakeScreenShotEvent());
                    },
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.photo_camera,size: 40,),
                    ))),
          if (state.captureState == CaptureState.video)
            Expanded(
                child: IconButton(
                    style: IconButton.styleFrom(
                        side: const BorderSide(color: Colors.amberAccent,width: 1.5),
                        shape: const CircleBorder(),
                        foregroundColor: Colors.amberAccent
                    ),
                    onPressed: () {
                      state.isRecording
                          ? context.read<CameraBloc>().add(StopRecordingEvent())
                          : context
                              .read<CameraBloc>()
                              .add(StartRecordingEvent());
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(state.isRecording
                          ? Icons.stop_circle
                          : Icons.videocam,size: 40,),
                    ))),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (state.captureState == CaptureState.photo)
                  IconButton(
                      style: IconButton.styleFrom(
                          side: const BorderSide(color: Colors.amberAccent,width: 1.5),
                          shape: const CircleBorder(),
                          foregroundColor: Colors.amberAccent
                      ),
                      onPressed: () {
                        context
                            .read<CameraBloc>()
                            .add(const ToggleCaptureEvent(CaptureState.video));
                      },
                      icon: const Icon(Icons.videocam_outlined)),
                if (state.captureState == CaptureState.video)
                  IconButton(
                      style: IconButton.styleFrom(
                          side: const BorderSide(color: Colors.amberAccent,width: 1.5),
                          shape: const CircleBorder(),
                          foregroundColor: Colors.amberAccent
                      ),
                      onPressed: () {
                        context
                            .read<CameraBloc>()
                            .add(const ToggleCaptureEvent(CaptureState.photo));
                      },
                      icon: const Icon(Icons.photo_camera_outlined)),
                // MaterialCircleWidget(
                //     event: OpenGalaryEvent(), title: "Gallery",image: "assets/images/error.png",),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
