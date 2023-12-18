import 'package:shared/shared.dart';

import 'base_bloc_state.dart';
import 'base_cubit.dart';

class ValueCubit<T> extends BaseCubit<BaseValueChangedState> {
  ValueCubit._internal(this._value, this._disposeBag)
      : super(ValueChangedInitializeState(_value));

  factory ValueCubit.value(T value) {
    return ValueCubit._internal(value, DisposeBag());
  }

  late T _value;
  late DisposeBag _disposeBag;

  @override
  DisposeBag get disposeBag => _disposeBag;

  set value(T newValue) {
    _value = newValue;
    emit(ValueChangedState(_value));
  }

  T get value => _value;

  void dispose() {
    _disposeBag.dispose();
  }
}

abstract class BaseValueChangedState extends BaseBlocState {
  const BaseValueChangedState();

  List<Object?> get props => [];
}

class ValueChangedInitializeState<T> extends BaseValueChangedState {
  const ValueChangedInitializeState(this.value);

  final T value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ValueChangedInitializeState { crUser: $value }';
}

class ValueChangedState<T> extends BaseValueChangedState {
  const ValueChangedState(this.value);

  final T value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ValueChangedState { crUser: $value }';
}
