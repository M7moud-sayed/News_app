import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final Function onCategoryClick;

  const CategoryItemWidget(
      {super.key,
      required this.index,
      required this.categoryModel,
      required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClick(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight:
                index % 2 == 0 ? Radius.circular(0) : Radius.circular(25),
            bottomLeft:
                index % 2 == 0 ? Radius.circular(25) : Radius.circular(0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              categoryModel.image,
              fit: BoxFit.cover,
            ),
            Text(
              categoryModel.title,
              style: Constants.theme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
