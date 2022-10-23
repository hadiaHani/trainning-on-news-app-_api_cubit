import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget biuldArticalItem(articles) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage("${articles['urlToImage']}"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${articles['title']}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "${articles['publishedAt']}",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget bTaskItem() {
  return Container();
}

Widget task({
  required List<Map> task,
}) =>
    ConditionalBuilder(
        condition: task.length > 0,
        builder: (context) => ListView.separated(
            itemBuilder: (context, index) {
              return bTaskItem();
            },
            separatorBuilder: (context, index) => MyDivider(),
            itemCount: task.length),
        fallback: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.menu,
                    size: 100,
                    color: Colors.grey,
                  ),
                  Text(
                    "sfsdfsd gsdgsd d",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                  )
                ],
              ),
            ));

Widget MyDivider() =>
    const Padding(padding: EdgeInsetsDirectional.only(start: 20));

Widget ArticleBuilder(list) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => biuldArticalItem(list[index]),
        separatorBuilder: (context, index) => MyDivider(),
        itemCount: list.length),
    fallback: (context) => const Center(
          child: CircularProgressIndicator(),
        ));
