import 'dart:io';

import 'package:flutter_svg/svg.dart';

import '../../main_export.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard(
      {super.key,
      this.width = 60,
      required this.imageUrl,
      this.isAsset = false,
      this.borderRadius = 500,
      this.isRectangle = false,
      this.height,
      this.border,
      this.fit});

  final double? width;
  final double? height;
  final double borderRadius;
  final String imageUrl;
  final bool isAsset;
  final bool isRectangle;
  final Border? border;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? width,
      width: width,
      decoration: BoxDecoration(
          shape: isRectangle ? BoxShape.rectangle : BoxShape.circle,
          border: border,
          borderRadius:
              isRectangle ? BorderRadius.circular(borderRadius) : null),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageUrl.isEmpty
            ? errorWidget()
            : isAsset
                ? Image.file(
                    File(imageUrl),
                    fit: fit ?? BoxFit.cover,
                    errorBuilder: (context, object, trace) {
                      return errorWidget();
                    },
                  )
                : Image.network(
                    imageUrl,
                    fit: fit ?? BoxFit.cover,
                    errorBuilder: (context, object, trace) {
                      return errorWidget();
                    },
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(
                          child: SizedBox(
                        height: width,
                        width: width,
                      ));
                    },
                  ),
      ),
    );
  }

  Widget errorWidget() {
    return Container(
      decoration: BoxDecoration(
        shape: isRectangle ? BoxShape.rectangle : BoxShape.circle,
        border: border,
        borderRadius: isRectangle ? BorderRadius.circular(borderRadius) : null,
        color: ConstantColor.white,
      ),
      child: SvgPicture.asset(
        SvgPath.folder,
        fit: BoxFit.scaleDown,
        width: 24,
        height: 30,
      ),
    );
  }
}

