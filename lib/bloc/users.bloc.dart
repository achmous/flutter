import 'package:bloc/bloc.dart';
import 'package:github_users_bloc/model/users.model.dart';
import '../repository/users.repository.dart';
abstract class UsersEvent{}

class SearchUsersEvent extends UsersEvent{

  final int currentPage;
  final int totalePages;
  final int pageSize;
  final String key;
  SearchUsersEvent({required  this.key,required this.currentPage, required this.pageSize, required this.totalePages});


}

class NextPage extends SearchUsersEvent {
  NextPage({required super.key, required super.currentPage, required super.pageSize});
}
abstract class UsersState{

  final ListUsers list;
  final int currentPage;
  final int totalePages;
  final int pageSize;
  final String key;

  UsersState({required this.key,required this.list, required this.currentPage , required this.totalePages,required this.pageSize});

}
 class SearchUsersSuccessState extends UsersState {
  SearchUsersSuccessState({required this.key, required this.list, required this.currentPage, required this.totalePages, required this.pageSize}) : super(key: key, list: list);




}
 class SearchUsersIsLoadingState extends UsersState{
  SearchUsersIsLoadingState({required super.key, required super.list, required super.currentPage, required super.totalePages, required super.pageSize});


 }
 class SearchUsersErrorState extends UsersState{


   final String error;


 }
 class UsersInitialState extends UsersState{
  UsersInitialState({required super.key, required super.list, required super.currentPage, required super.totalePages, required super.pageSize});
}

class UsersBloc extends Bloc<UsersEvent,UsersState >{

  UsersRepository usersRepository = UsersRepository();


UsersBloc() : super(UsersInitialState()){

  
  on((SearchUsersEvent event, emit)async{
    emit(SearchUsersIsLoadingState());
   try{
     ListUsers listeUsers = await usersRepository.searchUsers(event.key, event.currentPage, event.pageSize);
     int totalPage = (listeUsers.totalCount / event.pageSize).floor();
     if(listeUsers.totalCount % event.pageSize !=0 )
       totalPage = totalPage+1;
     emit(SearchUsersSuccessState(key : event.key,list : listeUsers, currentPage: event.currentPage,totalePages : totalPage ,pageSize : event.pageSize));
   } catch(ex) {
     emit(SearchUsersErrorState(error : ex.toString()));
   }
  });
 }
}







