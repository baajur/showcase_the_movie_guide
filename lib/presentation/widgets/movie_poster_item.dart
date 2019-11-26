import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePosterItem extends StatelessWidget {
  final String _url;

  final double height;
  final double width;

  const MoviePosterItem(
    this._url, {
    Key key,
    this.height = 165,
    this.width = 110,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        child: CachedNetworkImage(
          imageUrl: _url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
