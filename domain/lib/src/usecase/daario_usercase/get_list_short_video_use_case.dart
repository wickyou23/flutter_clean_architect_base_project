// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:proto_dart/proto_dart_daario.dart';

// import '../../../domain.dart';

// part 'get_list_short_video_use_case.freezed.dart';

// @Injectable()
// class GetListShortVideoUseCase extends BaseFutureUseCase<
//     GetListShortVideoUseCaseInput, GetListShortVideoUseCaseOutput> {
//   GetListShortVideoUseCase(this._repository) : super();

//   final DaarioRepositoy _repository;

//   @protected
//   @override
//   Future<GetListShortVideoUseCaseOutput> buildUseCase(
//       GetListShortVideoUseCaseInput input) {
//     return _repository.getListShortVideo(input);
//   }
// }

// @freezed
// class GetListShortVideoUseCaseInput extends BaseInput
//     with _$GetListShortVideoUseCaseInput {
//   const GetListShortVideoUseCaseInput._();

//   const factory GetListShortVideoUseCaseInput({
//     @Default(0) int pageIndex,
//     @Default(15) int pageSize,
//   }) = _GetListShortVideoUseCaseInput;
// }

// @freezed
// class GetListShortVideoUseCaseOutput extends BaseOutput
//     with _$GetListShortVideoUseCaseOutput {
//   const factory GetListShortVideoUseCaseOutput({
//     @Default([]) List<VideoShort> videos,
//   }) = _GetListShortVideoUseCaseOutput;
// }
