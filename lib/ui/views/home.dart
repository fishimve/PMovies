import 'package:PMovies/ui/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../viewmodels/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.getPopularMovies(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color(0xFFEDEEF0),
        appBar: AppBar(
          title: Text('Popular Movies'),
        ),
        body: model.busy
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).primaryColor,
                    ),
                    strokeWidth: 3,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: model.popularMovies.length,
                padding: const EdgeInsets.only(top: 5),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => model.navigateToMovieView(index),
                  child: MovieWidget(
                    movie: model.popularMovies[index],
                  ),
                ),
              ),
      ),
    );
  }
}
