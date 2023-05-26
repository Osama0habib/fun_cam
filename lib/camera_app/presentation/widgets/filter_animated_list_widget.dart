import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/utils/app_constant.dart';
import '../../data/model/ar_model.dart';
import '../manager/camera_bloc.dart';
import 'material_circle_widget.dart';

class FilterAnimatedListWidget extends StatelessWidget {
  const FilterAnimatedListWidget({Key? key ,required this.filterList,required this.isVisable}) : super(key: key);

  final List<ArModel> filterList;
  final bool isVisable;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
          visible: isVisable,
          child: AnimationLimiter(
            child: ListView.builder(
              itemCount: filterList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,
                  int index) {
                return AnimationConfiguration
                    .staggeredList(
                  position: index,
                  duration: const Duration(
                      milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: SizedBox(width: 70,
                        child: MaterialCircleWidget(
                          event: SwitchEffectEvent(
                              filterList[
                              index]
                                  .file),
                          title: AppConstant
                              .getFileName(filterList[
                          index]
                              .file),
                          image: filterList[index]
                              .image,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
