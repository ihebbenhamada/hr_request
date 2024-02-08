import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle({
    super.key,
    required this.image,
    required this.size,
    required this.iconSize,
    this.imageSize,
    this.bottom,
    this.left,
    this.circleColor,
    this.icon,
  });
  final String image;
  final String? icon;
  final double size;
  final double iconSize;
  final double? imageSize;
  final double? bottom;
  final double? left;
  final Color? circleColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: imageSize ?? size,
          height: imageSize ?? size,
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
          ),
          child: Center(
            child: Image.asset(
              image,
              width: imageSize ?? size,
              height: imageSize ?? size,
            ),
          ),
        ),
        Positioned(
          left: left ?? 9.h,
          bottom: bottom ?? 0,
          child: Image.asset(
            icon ?? AppImages.innTechLogo,
            height: iconSize,
            width: iconSize,
          ),
        ),
        Image.asset(
          AppImages.avatarCircle,
          height: size,
          width: size,
          color: circleColor,
        ),
      ],
    );
  }
}
