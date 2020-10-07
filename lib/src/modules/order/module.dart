import 'package:app/src/modules/order/data/repository/order_repository_implementation.dart';
import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:app/src/modules/order/presentation/index.dart';
import 'package:app/src/modules/order/presentation/rating/index.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OrderController()),
        Bind((i) => OrderRepositoryImplementation()),
      ];

  @override
  List<Router> get routers => [
        Router(ORDER_SCREEN, child: (_, args) => OrderScreen()),
        Router(RATING_SCREEN, child: (_, args) => RatingScreen()),
      ];

  static const ORDER_SCREEN = '/order';
  static Future toOrderScreen() => Modular.to.pushNamed(ORDER_SCREEN);

  static const RATING_SCREEN = '/rating';
  static Future toRatingScreen() => Modular.to.pushNamed(RATING_SCREEN);
}
