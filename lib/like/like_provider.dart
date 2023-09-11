import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/like/create/like_create_modal.dart';
import 'package:xb2_flutter/like/destory/like_destory_modal.dart';

final likeCreateProvider = ChangeNotifierProxyProvider<AppService, LikeCreateModal>(
  create: (context) => LikeCreateModal(appService: context.read<AppService>()), 
  update: (context, appService, likeCreateModal) => LikeCreateModal(appService: appService)
);

final likeDestoryProvider = ChangeNotifierProxyProvider<AppService, LikeDestoryModal>(
  create: (context) => LikeDestoryModal(appService: context.read<AppService>()),
  update: (context, appService, likeDestoryModal) => LikeDestoryModal(appService: appService),
);

final likeProviders = [
  likeCreateProvider,
  likeDestoryProvider,
];