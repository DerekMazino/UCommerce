import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:ucommerce_client/core/usecases/usecase.dart';
import 'package:ucommerce_client/domain/entities/entities.dart';
import 'package:ucommerce_client/domain/repositories/usuario_repository.dart';

class GetUsuariosUseCase implements UseCase<Usuario, NoParams> {
  final UsuarioRepository usuarioRepository;
  GetUsuariosUseCase(this.usuarioRepository);

  @override
  Future<Either<Failure, Usuario>> call(NoParams params) async {
    return await usuarioRepository.getUsuarios();
  }
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
