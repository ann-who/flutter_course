import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:data_layer/src/service_locator.config.dart';

@InjectableInit()
void initializeServices() => $initGetIt(GetIt.I);
