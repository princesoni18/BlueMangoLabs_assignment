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
final class PostSortByAbv extends HomeBlocState{

  final List<Beers> posts;

  PostSortByAbv({required this.posts});

}

final class PostSorting extends HomeBlocState{
  
}
