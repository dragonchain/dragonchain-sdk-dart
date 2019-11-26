import 'package:dragonchain_sdk/dragonchain_sdk.dart';

main() async {
  DragonchainClient dragonchainClient = DragonchainClient.createClient();
  var transaction = await dragonchainClient
      .createTransaction('myTransactionType', {"hello": "world"});
  logger.d(transaction);
}
