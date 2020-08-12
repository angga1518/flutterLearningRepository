import 'package:auto_loading_list_with_bloc/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  ScrollController sc = ScrollController();
  PostBloc pb;

  void onScroll() {
    double maxScroll = sc.position.maxScrollExtent;
    double currentScroll = sc.position.pixels;

    print(maxScroll.toString() + " | "+currentScroll.toString());
    if (currentScroll == maxScroll) {
      print("masuk");
      pb.add(PostEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    pb = BlocProvider.of<PostBloc>(context);
    pb.add(PostEvent());
    sc.addListener(() {
      onScroll();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto Loading API with bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "below here we can see list view that loads data every post reach 10 data",
            style: TextStyle(fontSize: 20),
          ),
          BlocBuilder<PostBloc, PostState>(
            builder: (context, postState) {
              if (postState is PostUnitialized) {
                return Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                );
              } else {
                PostLoaded pl = postState as PostLoaded;
                return Container(
                  height: 300,
                  child: ListView.builder(
                    controller: sc,
                    itemCount: (pl.hasReachedMax) 
                        ? pl.listPost.length
                        : pl.listPost.length + 1,
                    itemBuilder: (context, index) {
                      if (index < pl.listPost.length) {
                        return Container(
                            alignment: Alignment.center,
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(pl.listPost[index].id.toString()),
                                SizedBox(
                                  width: 200,
                                  child: Column(
                                    children: <Widget>[
                                      Text(pl.listPost[index].title.toString()),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(pl.listPost[index].body.toString()),
                                    ],
                                  ),
                                )
                              ],
                            ));
                      } else {
                        return Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
