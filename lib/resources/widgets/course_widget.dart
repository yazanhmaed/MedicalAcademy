import 'package:flutter/material.dart';
import 'package:medical_acadmey_app/models/course_model.dart';

import '../../course_screen/item_course.dart';
import '../color_manager.dart';
import '../components.dart';
import '../styles_manager.dart';
import '../values_manager.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget(
      {super.key, required this.courseModel, required this.index});
  final CourseModel courseModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: GestureDetector(
        onTap: () => navigateTo(context, ItemCourse(id: courseModel.id!)),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p5),
          margin: const EdgeInsets.symmetric(vertical: Appheight.h5),
          height: Appheight.h60,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorManager.grey2,
              ),
              borderRadius: BorderRadius.circular(AppSize.s8),
              color: ColorManager.grey1.withOpacity(0.8)),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${index + 1}  ${courseModel.title!}',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: AppSize.s18),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
