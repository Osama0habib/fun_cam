import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_cam/camera_app/presentation/manager/camera_bloc.dart';

import '../../../core/utils/enums.dart';

class FlashButton extends StatelessWidget {
  const FlashButton({Key? key,required this.state}) : super(key: key);

  final CameraState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: 16, vertical: AppBar().preferredSize.height + 20),
      child: Visibility(
          visible: state.controller != null &&
              state.controller!.isInitialized &&
              !state.showFilterList &&
              state.controller?.cameraDirection.name ==
                  CameraDirection.rear.name,
          child: IconButton(
            padding: const EdgeInsets.all(16),
            style: IconButton.styleFrom(backgroundColor: Colors.black12,shape: const CircleBorder(side: BorderSide(color: Colors.grey))),
            onPressed: () {
              context.read<CameraBloc>().add(ToggleFlashEvent());
            },
            icon: Icon(
              Icons.flash_on,
              color: state.flashOn ? Colors.yellow : Colors.grey,
            ),
          )),
    );
  }
}
