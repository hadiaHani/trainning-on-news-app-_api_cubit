import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_/Dio/dio_helper.dart';
import 'package:news_app_/News_app/business.dart';
import 'package:news_app_/News_app/science.dart';
import 'package:news_app_/News_app/sports.dart';
import 'package:news_app_/cubit/state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];

  List<Widget> screens = const [Business(), Sports(), Science()];
  void OnChangeBottomBar(int index) {
    currentIndex = index;
    if (index == 1) getSpports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> businnes = [];

  void getBusinnes() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "us",
      "category": "business",
      "apiKey": "51226ab8287f4e449cde99977adaaae2",
    }).then((value) {
      businnes = value?.data["articles"];
      print(businnes[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSpports() {
    if (sports.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "us",
        "category": "sports",
        "apiKey": "51226ab8287f4e449cde99977adaaae2",
      }).then((value) {
        sports = value?.data["articles"];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());

        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    if (science.isEmpty) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "us",
        "category": "science",
        "apiKey": "51226ab8287f4e449cde99977adaaae2",
      }).then((value) {
        science = value?.data["articles"];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(science.toString());

        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }
}
