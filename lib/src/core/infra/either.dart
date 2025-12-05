import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
abstract class Either<L, R> with _$Either<L, R> {
  const Either._();

  const factory Either.left(L value) = Left<L, R>;
  const factory Either.right(R value) = Right<L, R>;

  T fold<T>(T Function(L l) ifLeft, T Function(R r) ifRight) {
    return when(left: ifLeft, right: ifRight);
  }
}
