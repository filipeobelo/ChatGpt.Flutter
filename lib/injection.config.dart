// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_gpt/shared/network/network.dart' as _i8;
import 'package:chat_gpt/features/chat/data/repository/chat_repository.dart'
    as _i5;
import 'package:chat_gpt/features/chat/data/service/chat_service.dart' as _i4;
import 'package:chat_gpt/features/chat/domain/chat_use_case.dart' as _i6;
import 'package:chat_gpt/features/chat/presentation/cubit/chat_cubit.dart'
    as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.Dio>(networkModule.provideDio());
    gh.factory<_i4.ChatService>(() => _i4.ChatServiceImpl(gh<_i3.Dio>()));
    gh.factory<_i5.ChatRepository>(
        () => _i5.ChatRepositoryImpl(gh<_i4.ChatService>()));
    gh.factory<_i6.ChatUseCase>(
        () => _i6.ChatUseCaseImpl(gh<_i5.ChatRepository>()));
    gh.factory<_i7.ChatCubit>(() => _i7.ChatCubit(gh<_i6.ChatUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i8.NetworkModule {}
