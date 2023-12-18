import 'package:data/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test `map` function', () {
    group('should return correct T when using valid data', () {
      test('should return correct String when response is String', () {
        // arrange
        const validResponse = 'validResponse';
        const expected = 'validResponse';
        // act
        final result = PlainResponseMapper().map(
          response: validResponse,
        );
        // assert
        expect(result, expected);
      });

      test('should throw AssertionError when response is null', () {
        expect(
          () => PlainResponseMapper().map(
            response: null,
          ),
          throwsAssertionError,
        );
      });

      test(
        'should throw RemoteException.invalidSuccessResponseMapperType when response type is incorrect',
        () {
          // arrange
          const response = [
            {
              'uid': 2,
              'email': 'email',
            },
          ];

          final result = PlainResponseMapper<String>().map(
            response: response,
          );

          // assert
          expect(result, null);
        },
      );
    });
  });
}
