import 'package:auto_loading_list_with_bloc/model/getapi.dart';
import 'package:bloc/bloc.dart';

class PostEvent {}

class PostState {}

class PostUnitialized extends PostState {}

class PostLoaded extends PostState {
  bool hasReachedMax;
  List<Post> listPost;

  PostLoaded({this.hasReachedMax, this.listPost});

  PostLoaded copyWith({bool hasReachedMax, List<Post> listPost}) {
    return PostLoaded(
      hasReachedMax: this.hasReachedMax ?? hasReachedMax,
      listPost: this.listPost ?? listPost,
    );
  }
}

class PostBloc extends Bloc<PostEvent, PostState> {
  List<Post> listPost = [];

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (state is PostUnitialized) {
      listPost = await Post.getData(0, 10);
      yield PostLoaded(hasReachedMax: false, listPost: listPost);
    } else {
      PostLoaded pl = state as PostLoaded;
      listPost = await Post.getData(pl.listPost.length, 10);

      yield (listPost.isEmpty)
          ? pl.copyWith(hasReachedMax: true)
          : pl.copyWith(listPost: pl.listPost + listPost);
    }
  }

  @override
  // TODO: implement initialState
  PostState get initialState => PostUnitialized();
}
