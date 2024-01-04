part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class PostsInitialfetchEvent extends HomeBlocEvent{}

class PostSortByAbvEvent extends HomeBlocEvent{}

