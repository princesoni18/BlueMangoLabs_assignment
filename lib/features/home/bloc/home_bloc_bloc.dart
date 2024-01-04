import 'dart:async';
import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:dev_assignment/services/post_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  int page=0;
  HomeBlocBloc() : super(HomeBlocInitial()) {
    
    
    on<PostsInitialfetchEvent>(postsInitialfetchEvent);

    on<PostSortByAbvEvent>(postSortByAbvEvent);
    
    
  }

  FutureOr<void> postsInitialfetchEvent(PostsInitialfetchEvent event, Emitter<HomeBlocState> emit)async {
    
    try{
     final currentstate=state;
     if(currentstate is PostLoadingState) return ;

     List<Beers> oldposts=[];

     if(currentstate is PostLoadedState){
      oldposts=currentstate.posts;
     }


     emit(PostLoadingState(oldposts,firstFetch: page==0?true:false));

     page++;
  List<Beers> newPosts=await PostRepo.Fetchposts(page);

  oldposts.addAll(newPosts);
  emit(PostLoadedState(posts: oldposts));

    }
    catch(e){
      print("error occured");
      print(e.toString());
      return ;
    }


  }

  FutureOr<void> postSortByAbvEvent(PostSortByAbvEvent event, Emitter<HomeBlocState> emit) async{

   
    final currentstate=state;
    List <Beers> sorted=[];
    if(currentstate is PostLoadedState){

      sorted = await List.from(currentstate.posts)..sort((a, b) => a.abv.compareTo(b.abv));

     print("in this");
    }
    // emit(PostSorting());
    
    

    emit(PostLoadedState(posts: sorted));
  }
}
