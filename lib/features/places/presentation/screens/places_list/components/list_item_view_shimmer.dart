import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/values/app_colors.dart';
import 'package:places/values/size_config.dart';
import 'package:shimmer/shimmer.dart';

class ListItemViewShimmer extends StatelessWidget {
  ListItemViewShimmer();

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(SizeConfig.default_radius);
    double imageSize = 120.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: SizeConfig.default_padding),
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          child: Container(
            padding: const EdgeInsets.all(SizeConfig.default_padding / 2),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                    baseColor: AppColors.shimmerColor,
                    highlightColor: AppColors.shimmerHighlightColor,
                    child: Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        color: AppColors.shimmerColor,
                        borderRadius: borderRadius,
                      ),
                    )),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: imageSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Shimmer.fromColors(
                          baseColor: AppColors.shimmerColor,
                          highlightColor: AppColors.shimmerHighlightColor,
                          child: Container(
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: AppColors.shimmerColor,
                              // borderRadius: borderRadius,
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: AppColors.shimmerColor,
                          highlightColor: AppColors.shimmerHighlightColor,
                          child: Container(
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: AppColors.shimmerColor,
                              // borderRadius: borderRadius,
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: AppColors.shimmerColor,
                          highlightColor: AppColors.shimmerHighlightColor,
                          child: Container(
                            height: 16.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: AppColors.shimmerColor,
                              // borderRadius: borderRadius,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
