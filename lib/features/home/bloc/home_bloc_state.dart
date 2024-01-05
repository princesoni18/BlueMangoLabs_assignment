part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

final class PostLoadedState extends HomeBlocState{

  final List<Beers> posts;
  

  PostLoadedState({required this.posts, });
}
final class PostLoadingState extends HomeBlocState{

  final List<Beers> oldposts;

 final bool firstFetch;

  PostLoadingState(this.oldposts,{this.firstFetch=false});


}
final class PostsFilterByAbvState extends HomeBlocState{

  final List<Beers> posts;

  PostsFilterByAbvState({required this.posts});

}

final class PostsFiltering extends HomeBlocState{

  final List<Beers> oldposts;
  final bool IsFirstFetch;

  PostsFiltering(this.oldposts,{this.IsFirstFetch=false});
  
}

final class PostActionState extends HomeBlocState{}

final class PostFilteredByIbu extends HomeBlocState{

  final List<Beers> posts;

  PostFilteredByIbu(this.posts);


}

