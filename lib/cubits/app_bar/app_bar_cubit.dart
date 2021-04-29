import 'package:bloc/bloc.dart';

class AppBarCubit extends Cubit<double> {
  AppBarCubit() : super(0);
  void setOffset(double offset) => emit(offset);
}

//For bloc: event->bloc->state
//For cubit: bloc->state
