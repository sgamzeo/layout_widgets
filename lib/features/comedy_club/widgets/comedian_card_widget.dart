import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:layout_widgets/core/constants/dimens.dart';

class ComedianCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;

  const ComedianCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required double rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.r,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
          SizedBox(height: Dimens.spaceSmall),
          Text(
            name,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(specialty, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
