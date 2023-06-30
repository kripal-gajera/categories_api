import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_model.dart';

class Data_Categories extends StatefulWidget {
  const Data_Categories({Key? key}) : super(key: key);

  @override
  State<Data_Categories> createState() => _Data_CategoriesState();
}

class _Data_CategoriesState extends State<Data_Categories> {
  Future<CategoryModel> FetchData() async {
    final data = await http.get(
        Uri.parse("http://flutter430.forefrontinfotech.com/api/categories"));
    print(data);
    CategoryModel categoryModel = categoryModelFromJson(data.body);
    return categoryModel;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: FutureBuilder<CategoryModel>(
                future: FetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(snapshot
                                    .data!.categories[index].name
                                    .toString()),
                              ))),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.hasError.toString());
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Flexible(
                flex: 15,
                child: Container(
                  child: FutureBuilder<CategoryModel>(
                    future: FetchData(),
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(snapshot.data!
                                          .categories[index].image.src),
                                      fit: BoxFit.fill),
                                ));
                          },
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
