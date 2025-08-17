import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/components/custom_cached_image.dart';
import 'package:layout_widgets/core/components/custom_horizontal.gallery.dart';

class ComedyClubGallery extends StatelessWidget {
  const ComedyClubGallery({super.key});

  final String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScqw0IRhZaug89VWzhJtFHUFpUcgj573jcCA&s";

  @override
  Widget build(BuildContext context) {
    return CustomHorizontalGallery<String>(
      items: [image, image, image],
      height: 200.r,
      itemBuilder: (context, item, index) {
        return CustomCachedImage(imageUrl: item, width: 300.r, height: 200.r);
      },
      onTap: (item, index) {},
    );
  }
}
