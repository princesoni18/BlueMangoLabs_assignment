
import 'package:dev_assignment/features/home/bloc/home_bloc_bloc.dart';
import 'package:dev_assignment/features/home/models/beer_model2.dart';
import 'package:dev_assignment/features/home/ui/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:range_slider_dialog/range_slider_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBlocBloc homebloc = HomeBlocBloc();
  final _controller = ScrollController();


final TextEditingController _abvController=TextEditingController();



RangeValues selectedValues=const RangeValues(1,40);

void showpopup(int value)async{
if(value==3){
  homebloc.add(PostsInitialfetchEvent());

  return;
}
selectedValues=const RangeValues(1,40);
if(value==2){
  selectedValues=const RangeValues(1, 350);
}
  await RangeSliderDialog.display<int>(context,
      minValue: 1,
      maxValue: value==1?50:350,
      acceptButtonText: 'Apply',
      cancelButtonText: 'Cancel',
      headerText: value==1?"Filter by Abv value":"Filter by Ibu value",
      selectedRangeValues: selectedValues, onApplyButtonClick: (val) {
    if(value==1){
      homebloc.add(PostsFilterByAbvEvent(val!, true));

    }
    else if(value==2){
      homebloc.add(PostFilterByIbuEvent(val!, true));
    }
    Navigator.pop(context);
  });




}


  void setupcontroller(context) {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0) {
          if(homebloc.state is PostLoadedState){
          homebloc.add(PostsInitialfetchEvent());}

          else if(homebloc.state is PostsFilterByAbvState){
            homebloc.add(PostsFilterByAbvEvent(selectedValues,false));
          }
          else if(homebloc.state is PostFilteredByIbu){

            homebloc.add(PostFilterByIbuEvent(selectedValues, false));
          }
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
  void dispose() {
    // TODO: implement dispose
    _abvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
           pop_UpMenu(),
          
        ],
        title: const Text("  Prince soni assignment"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[100],
      body: BlocConsumer<HomeBlocBloc, HomeBlocState>(
        bloc: homebloc,
        listenWhen: (previous, current) => homebloc.state is PostActionState,
        listener: (context, state) {
         
          
        },
        builder: (context, state) {
          if (state is PostLoadingState && state.firstFetch) {
            return const Center(child: CircularProgressIndicator());
          } else {
            bool isloading = false;
            List<Beers> list = [];
            if (state is PostLoadingState) {
              list = state.oldposts;
              isloading = true;
            } else if (state is PostLoadedState) {
              list = state.posts;

              isloading = false;
            } else if (state is PostsFiltering) {
             list =state.oldposts;
             isloading=true;
            }

            else if(state is PostsFilterByAbvState){
              list=state.posts;
              isloading=false;
            }
            else if(state is PostFilteredByIbu){
              isloading=false;

              list=state.posts;
            }

           

            if (list.isNotEmpty) {
              return ListView.builder(
                  controller: _controller,
                  itemCount: list.length + (isloading == true ? 1 : 0),
                  itemBuilder: ((context, index) {
                    if (index < list.length) {
                      return ListElem(beer: list[index]);
                    } else {
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }));
            }
            return Container(
              child: Center(

                child: Lottie.network("https://lottie.host/582cbc3a-4ecc-4838-8b4e-7da8a2cc22d6/Pkw5ZJv5XK.json"),
              ),
            );
          }
        },
      ),
    );
  
  }

  PopupMenuButton<int> pop_UpMenu() {
    return PopupMenuButton<int>(
          child:const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.sort),
          ),
          onSelected: (value) {
            // Handle menu item selection
            showpopup(value);
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<int>(
              value: 1,
              child: Text('Filter by Abv'),
            ),
            const PopupMenuItem<int>(
              value: 2,
              child: Text('Filter by Ibu'),
            ),
            const PopupMenuItem<int>(
              value: 3,
              child: Text('None'),

              
            ),
          ],
        );
  }}

  

