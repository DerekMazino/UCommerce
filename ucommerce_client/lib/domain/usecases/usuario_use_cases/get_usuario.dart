import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:ucommerce_client/core/usecases/usecase.dart';
import 'package:ucommerce_client/domain/entities/entities.dart';
import 'package:ucommerce_client/domain/repositories/usuario_repository.dart';

class GetUsuarioUseCase implements UseCase<UsuarioEntity, Params> {
  final UsuarioRepository? usuarioRepository;
  GetUsuarioUseCase(this.usuarioRepository);

  @override
  Future<Either<Failure, UsuarioEntity>> call(Params params) async {
    return await usuarioRepository!.getUsuario(params.id);
  }
}

class Params extends Equatable {
  final int id;
  const Params(this.id);

  @override
  List<Object?> get props => [id];
}
