import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';

import '../../../models/source_model.dart';

class TabItem extends StatelessWidget {
  final SourceModel sourceModel;
  bool isSelected;
  TabItem({super.key, required this.sourceModel,this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: 45,
      decoration: BoxDecoration(
        color: isSelected ? Constants.theme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Constants.theme.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        sourceModel.name,
        style: Constants.theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : Constants.theme.primaryColor,
        ),
      ),
    );
  }
}
