import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/camera_bloc.dart';

class MaterialCircleWidget extends StatelessWidget {
  const MaterialCircleWidget(
      {Key? key, required this.event, required this.title, required this.image})
      : super(key: key);
  final CameraEvent event;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          shape:
              const CircleBorder(side: BorderSide(color: Colors.amberAccent)),
          color: Colors.amberAccent,
          surfaceTintColor: Colors.amberAccent,
          elevation: 10,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              context.read<CameraBloc>().add(event);
            },
            child: SizedBox(
              width: 60,
              height: 60,
              child: FittedBox(
                child: ClipOval(
                  // borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage(
                      image,
                    ),
                    // color: Colors.amberAccent,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    // colorBlendMode: BlendMode.color,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
