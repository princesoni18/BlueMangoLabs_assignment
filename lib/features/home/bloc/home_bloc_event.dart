part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class PostsInitialfetchEvent extends HomeBlocEvent{}

class PostsFilterByAbvEvent extends HomeBlocEvent{
  final RangeValues value;
  final bool IsNew;

  PostsFilterByAbvEvent( this.value,this.IsNew);

}

class PostFilterByIbuEvent extends HomeBlocEvent{

  final RangeValues value;
  final bool IsNew;

  PostFilterByIbuEvent(this.value, this.IsNew);
  
}


