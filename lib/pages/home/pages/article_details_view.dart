import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';

import '../../../core/config/constants.dart';
import '../../../models/article_model.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleModel articleModel;

  ArticleDetailsView({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News Detail",
            style: Constants.theme.textTheme.bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 230,
              width: Constants.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage,
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
