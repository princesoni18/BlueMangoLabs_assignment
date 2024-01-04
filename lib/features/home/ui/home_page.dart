import 'package:dev_assignment/features/home/bloc/home_bloc_bloc.dart';
import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:dev_assignment/features/home/ui/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBlocBloc homebloc=HomeBlocBloc();
  final _controller =ScrollController();

 
void setupcontroller(context){
  _controller.addListener(() {
    if(_controller.position.atEdge){
      if(_controller.position.pixels!=0){

        homebloc.add(PostsInitialfetchEvent());
      }
    }
  });
}
  @override
  void initState() {
    homebloc.add(PostsInitialfetchEvent());

   setupcontroller(context);
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: ()=>homebloc.add(PostSortByAbvEvent()), icon: Icon(Icons.sort))],
        title: Text("Dev assignment"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: Colors.grey[100],
      body: BlocConsumer<HomeBlocBloc, HomeBlocState>(
        bloc: homebloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is PostLoadingState&&state.firstFetch){

            return CircularProgressIndicator();
          }

          else {
        bool isloading=false;
          List<Beers> list=[];
          if(state is PostLoadingState){

            list=state.oldposts;
            isloading=true;
          }
           else if(state is PostLoadedState){
             list=state.posts; 
              
              isloading=false;
            }
            else if(state is PostSorting){
              return Center(child: CircularProgressIndicator(),);
            }
            
            if(list.length>0){
              return ListView.builder(
                controller: _controller,
                itemCount: list.length+(isloading==true?1:0),
                itemBuilder: ((context, index) {

                  if(index<list.length){
                  return ListElem(beer: list[index]);
                  }
                  else{
                    return 
                     Container(
                      child: Center(child: CircularProgressIndicator()),
                     );
                  }
                }));
            }
            return Container(
              color: Colors.amber,
            );
          
          }
        },
      ),

    );
}}