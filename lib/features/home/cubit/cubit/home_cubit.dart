import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

int counter = 0;

void increment() {
  counter++;
  emit(IncrementState());
}

void decrement() {
 counter>0 ? counter--:counter=0;
  emit(DecrementState());
}
}