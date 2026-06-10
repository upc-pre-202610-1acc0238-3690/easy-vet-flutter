import 'package:easy_vet/core/storage/token_storage.dart';
import 'package:easy_vet/features/auth/data/auth_service.dart';
import 'package:easy_vet/features/auth/data/login_response_dto.dart';
import 'package:easy_vet/features/auth/domain/auth_repository.dart';
import 'package:easy_vet/features/auth/domain/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService service;
  final TokenStorage tokenStorage;

  const AuthRepositoryImpl({required this.service, required this.tokenStorage});

  @override
  Future<User> login(String email, String password) async {
    final LoginResponseDto dto = await service.login(email, password);
    
    await tokenStorage.saveToken(dto.token);

    return dto.toDomain();
  }
}
