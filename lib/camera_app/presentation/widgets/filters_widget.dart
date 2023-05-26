import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fun_cam/camera_app/presentation/manager/camera_bloc.dart';
import 'package:fun_cam/camera_app/presentation/widgets/filter_animated_list_widget.dart';

import '../../../core/utils/app_constant.dart';
import '../../../core/utils/enums.dart';
import 'material_circle_widget.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({Key? key, required this.state}) : super(key: key);
  final CameraState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: 8.0, vertical: AppBar().preferredSize.height + 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(state.filtersStatus == Status.loaded)
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialCircleWidget(
                        image: state.filterList.first.image,
                        title: "Filters",
                        event: ShowHideFilterListEvent()),
                    FilterAnimatedListWidget(isVisable: state.showFilterList, filterList: state.filterList),

                  ],
                ),
              ),
            ),
          if(state.effectsStatus == Status.loaded)
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialCircleWidget(
                        image: state.effectsList.first.image,
                        title: "Effects",
                        event: ShowHideEffectListEvent()),
                    FilterAnimatedListWidget(isVisable: state.showEffectList, filterList: state.effectsList),
                  ],
                ),
              ),
            ),
          if(state.masksStatus == Status.loaded)
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialCircleWidget(
                        image: state.maskList.first.image,
                        title: "Masks",
                        event: ShowHideMaskListEvent()),
                    FilterAnimatedListWidget(isVisable: state.showMaskList, filterList: state.maskList),
                  ],
                ),
              ),
            ),
          SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MaterialCircleWidget(
                    image: "assets/images/error.png",
                    title: "No Mask",
                    event: SwitchEffectEvent("null"),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
