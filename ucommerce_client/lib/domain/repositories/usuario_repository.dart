import 'package:dartz/dartz.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:ucommerce_client/domain/entities/entities.dart';

abstract class UsuarioRepository {
  Future<Either<Failure, UsuarioEntity>> getUsuarios();
  Future<Either<Failure, UsuarioEntity>> getUsuario(int id);
}
