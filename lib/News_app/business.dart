import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_/cubit/cubit.dart';
import 'package:news_app_/cubit/state.dart';
import 'package:news_app_/widgits.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).businnes;
        return ArticleBuilder(list);
      },
    );
  }
}
