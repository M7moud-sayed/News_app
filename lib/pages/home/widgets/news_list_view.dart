import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widgets/tab_item.dart';

import '../../../models/source_model.dart';
import 'article_list_widget.dart';

class NewsListView extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsListView({super.key, required this.sourcesList});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DefaultTabController(
          length: widget.sourcesList.length,
          child: TabBar(
            padding: EdgeInsets.symmetric(vertical: 15),
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            indicator: BoxDecoration(),
            dividerColor: Colors.transparent,
            dividerHeight: 0,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourcesList
                .map(
                  (e) => TabItem(
                    sourceModel: e,
                    isSelected: selectedIndex == widget.sourcesList.indexOf(e),
                  ),
                )
                .toList(),
          ),
        ),
        ArticleListWidget(
          sourceId: widget.sourcesList[selectedIndex].id,
        ),
      ],
    );
  }
}
