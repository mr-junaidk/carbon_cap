import 'package:flutter/material.dart';
import 'package:internship_task/data/response/status.dart';
import 'package:internship_task/utils/routes/routes_name.dart';
import 'package:internship_task/utils/utils.dart';
import 'package:internship_task/viewmodel/home_view_model.dart';
import 'package:internship_task/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          actions: [
            InkWell(
              child: Center(child: Text('Log Out')),
              onTap: (){
                userPreference.remove().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
            ),
            SizedBox(width: 20,)
          ],
        ),
        body: ChangeNotifierProvider(
            create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
            builder: (context, value, _){
              switch(value.moviesList.status){
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Text(value.moviesList.message.toString());
                case Status.COMPLETED:
                  return ListView.builder(
                      itemCount: value.moviesList.data!.movies!.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: ListTile(
                            leading: Image(image: NetworkImage(
                                value.moviesList.data!.movies![index].posterurl.toString()),
                            errorBuilder: (context, error, stack){
                              return Icon(Icons.error, color: Colors.red,);
                            },
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                            title: Text(value.moviesList.data!.movies![index].title.toString()),
                            subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                                Icon(Icons.star, color: Colors.yellow,)
                              ],
                            ),
                          ),
                        );
                      });
                case null:
                  // TODO: Handle this case.
              }
              return Container();
            }),
        )
    );
  }
}


