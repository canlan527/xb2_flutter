
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/auth/auth_model.dart';

// 提供AppService的数据，这个数据依赖AuthModal
final appServiceProvider = ChangeNotifierProxyProvider<AuthModel, AppService>(
  create: (context) => AppService(authModel: context.read<AuthModel>()), 
  update: (context, authModel, appService) => AppService(authModel: authModel),
);

final appProviders = [
  appServiceProvider,
];