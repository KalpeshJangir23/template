import 'dart:math';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/chat.dart';
import 'package:template/chat_bot/chatbot_screen.dart';
import 'package:template/screens/colorsutil.dart';
import 'package:template/states.dart';

class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List<ChatMessage> chatMessages = [
  ChatMessage(
    messageContent: "Jordan Peterson' latest video is cool",
    messageType: "receiver",
  ),
  ChatMessage(
    messageContent: "I really love his content, he spits out facts",
    messageType: "receiver",
  ),
  ChatMessage(
    messageContent: "The latest one?",
    messageType: "sender",
  ),
  ChatMessage(
    messageContent: "Yeah",
    messageType: "receiver",
  ),
];

List chatsData = [
  Chat(
    name: "Mindfull Green",
    lastMessage: "Yeah",
    image: "assets/luffy.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Bliss Seekers",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/elonMusk.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Focus Learners",
    lastMessage: "Do you have any update...",
    image: "assets/funny.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "WAGMI",
    lastMessage: "You’re welcome :)",
    image: "assets/help.png",
    time: "5d ago",
    isActive: true,
  ),
];

enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(186, 229, 244, 1),
        boxShadow: [
          BoxShadow(offset: const Offset(0, 4), blurRadius: 32, color: Colors.grey.withOpacity(0.08)),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Color.fromRGBO(8, 8, 38, 1),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type Message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.mic,
                      color: Color.fromRGBO(8, 8, 38, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Boody extends StatefulWidget {
  Function reload;
  Boody({super.key, required this.reload});

  @override
  State<Boody> createState() => _BoodyState();
}

class _BoodyState extends State<Boody> {
  ScrollController _mainController = ScrollController();
  late TextEditingController _controller;
  States states = GetIt.I.get();

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            controller: _mainController,
            child: ListView.builder(
              itemCount: chatMessages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DelayedDisplay(
                  slidingBeginOffset: Offset(0.2, 0),
                  child: Container(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (chatMessages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (chatMessages[index].messageType == "receiver" ? Colors.grey.shade200 : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          chatMessages[index].messageContent,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'EuclidCircular',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.only(left: 5, bottom: 5, top: 10),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'EuclidCircular',
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(hintText: "Write message...", hintStyle: TextStyle(color: Colors.black54), border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    String query = _controller.text;
                    _controller.text = "";
                    ChatMessage newMessage = ChatMessage(messageContent: query, messageType: "sender");
                    List<ChatMessage> newMessages = [...chatMessages, newMessage];
                    setState(() {
                      chatMessages = newMessages;
                    });
                    _mainController.animateTo(_mainController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    FocusManager.instance.primaryFocus?.unfocus();
                    states.lastMessage = query;
                    widget.reload();
                    debugPrint("updated: ${states.lastMessage}");
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class MessagesScreen extends StatefulWidget {
  Function reload;
  MessagesScreen({super.key, required this.reload});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Widgetbackground),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          // shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Row(
            children: [
              BackButton(),
              SizedBox(
                width: 4,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/luffy.png"),
              ),
              SizedBox(width: 16 * 0.75),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mindfull Green",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'EuclidCircular',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "19 active ",
                        style: TextStyle(color: Color.fromARGB(255, 205, 205, 205), fontSize: 10, fontFamily: "EuclidCircular"),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
            const SizedBox(width: 8),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Boody(reload: widget.reload),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop,
            child: Icon(
              Icons.backspace,
              color: const Color.fromARGB(255, 228, 224, 224),
              size: 25,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/luffy.png"),
          ),
          const SizedBox(width: 16 * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mindfull Green",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  const Text(
                    "no.of people active ",
                    style: TextStyle(fontSize: 7),
                  ),
                  Container(
                    height: 14,
                    width: 14,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.greenAccent),
                    child: const Text(
                      "19",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
        const SizedBox(width: 8),
      ],
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Profile Page",
              style: TextStyle(fontSize: 30, color: textColor),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0), shape: StadiumBorder(), backgroundColor: Colors.black),
                  child: Text(
                    "Recent Messages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'EuclidCircular',
                    ),
                  ),
                ),
                // FillOutlineButton(
                //   press: () {},
                //   text: "Recent Message",
                // ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0), shape: StadiumBorder(), backgroundColor: Colors.black),
                  child: Text(
                    "Active",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'EuclidCircular',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                index: index,
                chat: chatsData[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagesScreen(reload: () {
                      reload();
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatCard extends StatefulWidget {
  ChatCard({
    super.key,
    required this.chat,
    required this.press,
    required this.index,
  });
  final Chat chat;
  int index;
  final VoidCallback press;

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  States states = GetIt.I.get<States>();

  @override
  void initState() {
    debugPrint(states.lastMessage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 * 0.75),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/luffy.png"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chat.name,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'EuclidCircular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontFamily: 'EuclidCircular',
                          fontWeight: FontWeight.w400,
                        ),
                        widget.index != 0 ? widget.chat.lastMessage : states.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
                opacity: 0.7,
                child: Text(
                  widget.chat.time,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'EuclidCircular',
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: Body(),

      backgroundColor: mainColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(8, 8, 38, 1),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChatBotScreen();
          }));
        },
        child: const Icon(
          Icons.person_add_alt_1,
          color: textColor,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      title: const Text(
        "Community",
        style: TextStyle(
          fontSize: 22,
          fontFamily: 'EuclidCircular',
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(
            8,
            8,
            8,
            1,
          ),
        ),
      ),
      actions: [
        IconButton(
          color: const Color.fromRGBO(
            8,
            8,
            38,
            1,
          ),
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
