import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laporhoax/common/navigation.dart';
import 'package:laporhoax/domain/entities/feed.dart';
import 'package:laporhoax/presentation/pages/news/news_page.dart';
import 'package:laporhoax/presentation/pages/news/news_web_view.dart';
import 'package:laporhoax/presentation/provider/feed_notifier.dart';
import 'package:laporhoax/util/datetime_helper.dart';
import 'package:provider/provider.dart';

class SimpleItemFeed extends StatelessWidget {
  final Feed feed;

  SimpleItemFeed({required this.feed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () => Navigation.intentWithData(NewsWebView.routeName, feed),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFBABABA),
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: Offset(0.0, 2.0),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Hero(
                  tag: feed.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: CachedNetworkImage(
                      imageUrl: feed.thumbnail!,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 100,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: _Description(
                  title: feed.title!,
                  date: feed.date!,
                ),
              ),
              Consumer<FeedNotifier>(
                  builder: (context, data, child) =>
                      SaveButton(feed, data.isFeedSaved)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: Color(0xFFBABABA),
              ),
              Text(
                DateTimeHelper.formattedDate(date),
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Color(0xFFBABABA),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}