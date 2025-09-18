import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
import 'package:scoref_manager/app/utils/style.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontWeight;
  final Color color;
  final double? letterSpacing;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextOverflow? overflow;
  const AppText(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = "regular",
      this.color = AppColors.textPrimaryLight,
      this.letterSpacing,
      this.textAlign,
      this.height,
      this.maxLines,
      this.decoration,
      this.overflow,
      this.decorationColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: EasyRichText(
        text,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        defaultStyle: textStyle(
            color: color,
            height: height,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
            decorationColor: decorationColor,
            letterSpacing: letterSpacing),
        patternList: [
          //
          //#gfdgfgfgfgfgg#dsdsds
          //#gfdgdfgdfg#
          //dsdsdsd{Afttdfgdf65656dfdf}}fhgh{frgfgfg}dfd
          EasyRichTextPattern(
            targetString: '(\\*)(.*?)(\\*)',
            matchBuilder: (BuildContext? context, RegExpMatch? match) {
              return TextSpan(
                text: match![0]!.replaceAll('*', ''),
                style: textStyle(
                  fontWeight: "bold",
                  decorationColor: decorationColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
