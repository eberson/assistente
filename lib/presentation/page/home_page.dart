import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:sylvinho/service/gpt.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final request = ChatCompleteText(
      messages: [
        Messages(
          role: Role.user,
          content: "Qual foi o primeiro presidente negro nos Estados Unidos?",
        ),
      ],
      maxToken: 2000,
      model: GptTurboChatModel(),
    );

    
    final futureResponse = gpt.onChatCompletion(request: request);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: FutureBuilder<ChatCTResponse?>(
          future: futureResponse,
          builder: (context, snapshot){
            if (snapshot.hasError){
              return Text(
                "Ocorreu um erro ao realizar a pergunta: ${snapshot.error}",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.red,
                ),
              );
            }

            final text = snapshot.data?.choices.map((e) => e.message?.content)
                                               .where((e) => e != null)
                                               .join("\n") ?? "Aguardando...";

            return Text(
              text,
              style: theme.textTheme.titleMedium,
            );
          },
        ),
      ),
    );
  }
}