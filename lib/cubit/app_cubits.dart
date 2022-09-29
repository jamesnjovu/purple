import 'package:bloc/bloc.dart';
import 'package:purple/cubit/app_cubit_states.dart';
import 'package:purple/services/data_services.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit({required this.data}) :  super(InitialState()){

    emit(WelcomeState()
    );
  }
  final DataServices data;
  late final places;
 void getData()async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){

    }

 }
}