import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BackdropWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  const BackdropWidget({
    Key key,
    @required this.title,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54.withOpacity(.6),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      ),
      placeholder: (contxt, url) => Padding(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Theme.of(context).primaryColor,
          ),
          strokeWidth: 3,
        ),
        padding: const EdgeInsets.all(10.0),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
