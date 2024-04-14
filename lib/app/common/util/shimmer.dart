import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

customShimmer({
  Widget? widget,
  double? height,
  double? width,
  bool circle = false,
  int loop = 0,
}) {
  var child = widget;
  if (widget == null) {
    child = containerShimmer(height: height, width: width);
  }
  return Shimmer.fromColors(
    loop: loop,
    highlightColor: const Color(0xFFF5F5F5),
    baseColor: const Color(0xFFE0E0E0),
    child: circle ? ClipOval(child: child) : child!,
  );
}

containerShimmer({double? height, double? width, bool isCorner = true}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(
        Radius.circular(
          (isCorner == true ? 4.0 : 0),
        ),
      ),
    ),
  );
}
