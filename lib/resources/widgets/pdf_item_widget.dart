import 'package:flutter/material.dart';
import 'package:medical_acadmey_app/pdf_screen/pdf_view.dart';
import 'package:medical_acadmey_app/resources/components.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/Pdf_model.dart';
import '../color_manager.dart';
import '../styles_manager.dart';
import '../values_manager.dart';

class PdfItemWidget extends StatelessWidget {
  final PdfModel pdfModel;
  final int index;

  const PdfItemWidget({super.key, required this.pdfModel, required this.index});
  // ignore: unused_element
  _launchURL() async {
    const url = 'https://flutter.dev/exapmle.pdf';
    // ignore: deprecated_member_use
    if (await canLaunch(pdfModel.linkPdf!)) {
      // ignore: deprecated_member_use
      await launch(pdfModel.linkPdf!);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p5),
      child: GestureDetector(
        onTap: () => navigateTo(
            context,
            PdfView(
              link: pdfModel.linkPdf!,
              title: pdfModel.title!,
            )),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p5),
          margin: const EdgeInsets.symmetric(vertical: Appheight.h5),
          height: Appheight.h60,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorManager.grey2,
              ),
              gradient: SweepGradient(colors: [
                Color(0xff1450A3),
                Color(0xffdbe9f6),
              ], center: Alignment.topLeft, startAngle: 0.2),
              borderRadius: BorderRadius.circular(AppSize.s8),
              color: Color(0xff1450A3)),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Appwidth.w300,
                  child: Text('${index + 1} )  ${pdfModel.title!}',
                      style: getBoldStyle(
                          color: ColorManager.white, fontSize: AppSize.s15),
                      overflow: TextOverflow.ellipsis),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
