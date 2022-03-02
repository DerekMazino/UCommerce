import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ucommerce_client/core/error/exception.dart';
import 'package:ucommerce_client/core/network/network_info.dart';
import 'package:ucommerce_client/data/datasouerces/local/usuario_local_data_source.dart';
import 'package:ucommerce_client/data/datasouerces/remote/usuario_remote_data_source.dart';
import 'package:ucommerce_client/domain/entities/usuario_entity.dart';
import 'package:ucommerce_client/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ucommerce_client/domain/repositories/usuario_repository.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {
  final UsuarioRemoteDataSource? remoteDataSource;
  final UsuarioLocalDataSource? localDataSource;
  final NetworkInfo? networkInfo;

  UsuarioRepositoryImpl(
      this.remoteDataSource, this.localDataSource, this.networkInfo);

  @override
  Future<Either<Failure, UsuarioEntity>> getUsuario(int id) async {
    var result = await networkInfo!.isConnected;
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final remoteUsuario = await remoteDataSource!.getUsuario(id);
        localDataSource!.cacheUsuario(remoteUsuario);
        return Right(remoteUsuario);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localAlbum = await localDataSource!.getLastUsuario();
        return Right(localAlbum);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, UsuarioEntity>> getUsuarios() async {
    var result = await networkInfo!.isConnected;
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      try {
        final remoteUsuario = await remoteDataSource!.getUsuarios();
        localDataSource!.cacheUsuario(remoteUsuario);
        return Right(remoteUsuario);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localAlbum = await localDataSource!.getLastUsuario();
        return Right(localAlbum);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
