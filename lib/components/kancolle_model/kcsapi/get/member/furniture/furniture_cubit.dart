import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'furniture_state.dart';
part 'furniture_cubit.freezed.dart';
part 'furniture_cubit.g.dart';

class FurnitureCubit extends Cubit<FurnitureState> {
  FurnitureCubit() : super(FurnitureState.initial());
}
