import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Feed extends Equatable {
  Feed(
      {required this.id,
      required this.title,
      required this.content,
      required this.thumbnail,
      required this.date,
      required this.view,
      required this.author});

  Feed.toDb({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.date,
  });

  final int id;
  String? title;
  String? content;
  String? thumbnail;
  String? date;
  int? view;
  int? author;

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "date": date,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        content,
        thumbnail,
        date,
        view,
        author,
      ];
}
