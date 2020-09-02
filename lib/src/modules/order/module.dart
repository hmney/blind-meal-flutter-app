import 'package:app/src/modules/order/presentation/controller.dart';
import 'package:app/src/modules/order/presentation/index.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OrderController()),
      ];

  @override
  List<Router> get routers => [
        Router(ORDER_SCREEN, child: (_, args) => OrderScreen()),
      ];

  static const ORDER_SCREEN = '/order';
  static Future toOrderScreen() => Modular.to.pushNamed(ORDER_SCREEN);
}
