import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PosterWidget extends StatelessWidget {
  final String imageUrl;
  const PosterWidget({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (contxt, url) => CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Theme.of(context).primaryColor,
          ),
          strokeWidth: 3,
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
