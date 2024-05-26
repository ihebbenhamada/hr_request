import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:request_hr/config/colors/colors.dart';
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
    this.imageColor,
    this.icon,
    this.isNetworkImage = false,
    this.isBorderEnabled = true,
    this.stroke = false,
  });
  final String image;
  final String? icon;
  final double size;
  final double iconSize;
  final double? imageSize;
  final double? bottom;
  final double? left;
  final Color? circleColor;
  final Color? imageColor;
  final bool isNetworkImage;
  final bool isBorderEnabled;
  final bool stroke;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: imageSize ?? size,
          height: imageSize ?? size,
          decoration: ShapeDecoration(
            shape: OvalBorder(
              side: stroke
                  ? const BorderSide(
                      width: 1,
                      color: AppColors.gray14,
                    )
                  : BorderSide.none,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Center(
            child: isNetworkImage
                ? Image.network(
                    image,
                    width: imageSize ?? size,
                    height: imageSize ?? size,
                    color: imageColor,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, widget, event) {
                      if (event == null) return widget;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, object, stackTrace) {
                      return Image.asset(
                        AppImages.profile,
                        width: imageSize ?? size,
                        height: imageSize ?? size,
                      );
                    },
                  )
                : Image.asset(
                    AppImages.profile,
                    width: imageSize ?? size,
                    height: imageSize ?? size,
                    color: imageColor,
                  ),
          ),
        ),
        isBorderEnabled
            ? Positioned(
                left: left ?? 9.h,
                bottom: bottom ?? 0,
                child: Image.asset(
                  icon ?? AppImages.innTechLogo,
                  height: iconSize,
                  width: iconSize,
                ),
              )
            : const SizedBox(),
        isBorderEnabled
            ? Image.asset(
                AppImages.avatarCircle,
                height: size,
                width: size,
                color: circleColor,
              )
            : const SizedBox(),
      ],
    );
  }
}
