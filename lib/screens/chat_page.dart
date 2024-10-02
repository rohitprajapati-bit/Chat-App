import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/chatbubble.dart';
import 'package:chat_app/service/auth/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  final FocusNode? focusNode;
  ChatPage(
      {super.key,
      required this.receiverEmail,
      required this.receiverID,
      this.focusNode});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
//textController
  final TextEditingController _messageController = TextEditingController();

//chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //for textfield focus
  FocusNode myFocusNode = FocusNode();

//send message

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(
            const Duration(milliseconds: 500), () => scrollDwonlod());
      }
    });
    Future.delayed(const Duration(milliseconds: 500), () => scrollDwonlod());
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  //scroll controller

  final ScrollController _scrollController = ScrollController();
  void scrollDwonlod() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(
          widget.receiverID, _messageController.text);
      _messageController.clear();
      scrollDwonlod();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        children: [
          //disply msg
          Expanded(child: _buildMessagesList()),
          //user input
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverID, senderID),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const Text("Error");
            //loading
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          //return listview
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    String message = data['messages'] ?? 'No message'; // Handle null values
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data['message'], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  //build msg input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                focusNode: myFocusNode,
                controller: _messageController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: 'Type a message',
                    hintStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: Icon(
                (Icons.arrow_upward),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
