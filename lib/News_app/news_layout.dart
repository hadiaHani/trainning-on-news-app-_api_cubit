import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_/cubit/cubit.dart';
import 'package:news_app_/cubit/state.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinnes()
      /*  ..getSpports()
        ..getScience*/
      ,
      child: BlocConsumer<NewsCubit, NewsState>(listener: (context, state) {
        print("");
      }, builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.deepOrange,
            onTap: (index) {
              cubit.OnChangeBottomBar(index);
            },
          ),
        );
      }),
    );
  }
}
