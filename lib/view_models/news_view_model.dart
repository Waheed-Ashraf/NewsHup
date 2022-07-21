import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class NewsViewModle extends GetxController{
  getData(String category)async{
  final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=8e1d68ae10c2455b95d2cbb006eae855");
  http.Response response = await http.get(url);
  if(response.statusCode==200){
    try{
    return NewsModel.fromjson(jsonDecode(response.body));
    }catch(e){
      Get.snackbar("Can not get Data", e.toString(),
      snackPosition:SnackPosition.TOP,
      duration: const Duration(seconds: 15),
      );
    }
  }
  }
}