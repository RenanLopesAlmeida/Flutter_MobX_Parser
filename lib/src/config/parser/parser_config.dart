import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ParserConfig {
  static Future<void> initializeParser() async {
    await Parse().initialize(
      DotEnv().env['PARSER_APP_ID'],
      DotEnv().env['PARSER_SERVER_URL'],
      clientKey: DotEnv().env['PARSER_CLIENT_KEY'],
      autoSendSessionId: true,
      debug: true,
    );
  }
}
