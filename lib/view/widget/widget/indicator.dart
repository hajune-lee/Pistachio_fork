import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pistachio/global/theme.dart';
import 'package:pistachio/view/widget/widget/text.dart';

class PCircularPercentIndicator extends StatelessWidget {
  const PCircularPercentIndicator({
    Key? key,
    required this.percent,
    required this.color,
    this.textColor = PTheme.black,
    this.borderColor = PTheme.black,
    this.backgroundColor = PTheme.background,
    this.radius = 55.0,
    this.lineWidth = 16.0,
    this.centerText = '',
    this.onAnimationEnd,
    this.visible = true,
    this.duration = 1000,
  }) : super(key: key);

  final double percent;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double lineWidth;
  final String centerText;
  final VoidCallback? onAnimationEnd;
  final bool visible;
  final int duration;

  @override
  Widget build(BuildContext context) {
    final border = Border.all(
      color: borderColor,
      width: 1.5,
    );

    if (!visible) return Container();
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: border,
            shape: BoxShape.circle,
          ),
          child: CircularPercentIndicator(
            radius: radius.w,
            lineWidth: lineWidth.w,
            percent: percent,
            backgroundColor: backgroundColor,
            progressColor: color,
            animation: true,
            animationDuration: duration,
            onAnimationEnd: onAnimationEnd,
            curve: Curves.easeInOut,
            center: PText(centerText,
              color: textColor,
              style: textTheme.titleLarge,
              borderWidth: 1.0,
              maxLines: 2,
              align: TextAlign.center
            ),
          ),
        ),
        Container(
          width: (radius.w - lineWidth.w) * 2,
          height: (radius.w - lineWidth.w) * 2,
          decoration: BoxDecoration(
            border: border,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class PCircularProgressIndicator extends StatelessWidget {
  const PCircularProgressIndicator({
    Key? key,
    required this.visible,
  }) : super(key: key);

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return visible ? Stack(
      alignment: Alignment.center,
      children: const [
        CircularProgressIndicator(
          color: PTheme.colorA,
        ),
        // Container(
        //   color: PTheme.black.withOpacity(.3),
        // ),
      ],
    ) : Container();
  }
}
