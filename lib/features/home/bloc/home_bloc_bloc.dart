import 'dart:async';
import 'dart:math';

import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:dev_assignment/services/post_repository.dart';
import 'package:flutter/foundation.dart';


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  int page=0;
  int pageForAbv=0;

  int pageForIbu=0;
  HomeBlocBloc() : super(HomeBlocInitial()) {
    
    
    on<PostsInitialfetchEvent>(postsInitialfetchEvent);

    on<PostsFilterByAbvEvent>(postSortByAbvEvent);

    on<PostFilterByIbuEvent>(postFilterByIbuEvent);

   
    
    
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

  FutureOr<void> postSortByAbvEvent(PostsFilterByAbvEvent event, Emitter<HomeBlocState> emit) async{
   

   
   print("function called");
   
    final currentstate=state;
    List <Beers> filtered=[];
    
  try{
    if(event.IsNew!=true){
       if(currentstate is PostsFilterByAbvState){

        filtered=currentstate.posts;
       }

       emit(PostsFiltering(filtered,IsFirstFetch: page==0?true:false));
    }

       pageForAbv++;
      List<Beers> newPosts= await PostRepo.fetchByAbv(pageForAbv, event.value);
     if(event.IsNew==true){

      emit(PostsFilterByAbvState(posts: newPosts));
      return ;
     }
      filtered.addAll(newPosts);
    
   
  
    emit(PostsFilterByAbvState(posts: filtered));
  }catch(e){
   
    print(e.toString());
  }
  }

 

  

  FutureOr<void> postFilterByIbuEvent(PostFilterByIbuEvent event, Emitter<HomeBlocState> emit)async {

    print("function called");
   
    final currentstate=state;
    List <Beers> filtered=[];
    
  try{
    if(event.IsNew!=true){
       if(currentstate is PostFilteredByIbu){

        filtered=currentstate.posts;
       }

       emit(PostsFiltering(filtered,IsFirstFetch: page==0?true:false));
    }

       pageForIbu++;
      List<Beers> newPosts= await PostRepo.fetchByIbu(pageForIbu, event.value);
     if(event.IsNew==true){

      emit(PostsFilterByAbvState(posts: newPosts));
      return ;
     }
      filtered.addAll(newPosts);
    
   
  
    emit(PostFilteredByIbu( filtered));
  }catch(e){
   
    print(e.toString());
  }
  }
}
