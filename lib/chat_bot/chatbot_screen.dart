import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:template/chat_bot/messages.dart';
import 'package:template/screens/colorsutil.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late DialogFlowtter _dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    late var dialogFlowtter;
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await _dialogFlowtter.detectIntent(queryInput: QueryInput(text: TextInput(text: text)));

      if (response.message == null) {
        return;
      } else {
        setState(() {
          addMessage(response.message!);
        });
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Bot"),
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 28),
        color: mainColor,
        child: Column(
          children: [
            Expanded(
              child: MessagesScreen(messages: messages),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  //  color: Colors.deepPurple,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Color(0xFFFFBB5C),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: new InputDecoration.collapsed(hintText: 'Send a message', hintStyle: TextStyle(color: mainColor)),
                          style: const TextStyle(
                            color: textColor,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: Icon(Icons.send_sharp),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
