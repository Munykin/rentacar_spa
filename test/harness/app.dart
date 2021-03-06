import 'package:rentacar_spa/rentacar_spa.dart';
import 'package:aqueduct/test.dart';
import 'package:rentacar_spa/server/rentacar_spa_sink.dart';

export 'package:rentacar_spa/rentacar_spa.dart';
export 'package:aqueduct/test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

/// A testing harness for rentacar_spa.
///
/// Use instances of this class to start/stop the test rentacar_spa server. Use [client] to execute
/// requests against the test server.  This instance will use configuration values
/// from config.src.yaml.
class TestApplication {
  Application<RentacarSpaSink> application;
  RentacarSpaSink get sink => application.mainIsolateSink;
  TestClient client;

  /// Starts running this test harness.
  ///
  /// This method will start an [Application] with [RentacarSpaSink].
  ///
  /// You must call [stop] on this instance when tearing down your tests.
  Future start() async {
    RequestController.letUncaughtExceptionsEscape = true;
    application = new Application<RentacarSpaSink>();
    application.configuration.port = 0;
    application.configuration.configurationFilePath = "config.src.yaml";

    await application.start(runOnMainIsolate: true);

    client = new TestClient(application);
  }

  /// Stops running this application harness.
  ///
  /// This method must be called during test tearDown.
  Future stop() async {
    await application?.stop();
  }
}
