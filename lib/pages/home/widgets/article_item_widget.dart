import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/main.dart';

import '../../../models/article_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final ArticleModel articleModel;

  ArticleItemWidget({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState!.pushReplacementNamed(
            PagesRouteName.articleDetailsView,
            arguments: articleModel);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 230,
              width: Constants.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: articleModel.urlToImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              articleModel.source.name,
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodySmall
                  ?.copyWith(color: Color(0xFF79828B)),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              articleModel.title,
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                  color: Color(0xFF42505C), fontSize: 18, height: 1.1),
            ),
          ],
        ),
      ),
    );
  }
}
