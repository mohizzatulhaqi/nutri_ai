import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
