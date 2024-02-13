import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/style/text_style.dart';
import 'package:netflix_clone/widgets/constants.dart';
import 'package:netflix_clone/widgets/overview_widget.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(top: 16, left: 16),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.4), borderRadius: BorderRadius.circular(15)),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded)),
          ),
          backgroundColor: Colors.black,
          expandedHeight: 400,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(movie.title, style: Headings),
            centerTitle: true,
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              child: Image.network(
                "${Constants.imagePath}${movie.backDropPath}",
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OverviewWidget(movie: movie),
          ),
        ),
       
      ],
    ));
  }
}
