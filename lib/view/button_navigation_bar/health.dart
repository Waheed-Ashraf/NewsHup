import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/view_models/news_view_model.dart';

// ignore: use_key_in_widget_constructors
class Health extends GetWidget<NewsViewModle> {
  final Controller = Get.put(NewsViewModle());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Controller.getData('health'),
        builder: (context, AsyncSnapshot snapshot) {
          NewsModel? data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data!.articles!.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Image.network(
                            data.articles![index].urlToImage.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          data.articles![index].title.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          data.articles![index].description.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ));
          }
        },
      ),
    );
  }
}
