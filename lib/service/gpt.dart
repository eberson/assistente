import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

OpenAI get gpt => OpenAI.instance.build(
  token: "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",
  //orgId: "org-zd994TwIpxVGcvj84nJm6m91",
  enableLog: true,  
  baseOption: HttpSetup(
    receiveTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  ),
);
