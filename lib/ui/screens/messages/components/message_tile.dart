import 'package:flutter/material.dart';

import '../chat_screen.dart';

class MessageTile extends StatefulWidget {
  MessageTile(
      {Key? key,
      required this.image,
      required this.pinned,
      required this.receiverName,
      required this.recentMessage,
      required this.recentMessageTime})
      : super(key: key);

  final String image;
  final String receiverName;
  final String recentMessage;
  final String recentMessageTime;
  bool pinned;

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black45,
                radius: 32,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (widget.pinned)
                          const Icon(
                            Icons.push_pin_sharp,
                            color: Colors.grey,
                          ),
                        Text(
                          widget.receiverName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.recentMessage,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.recentMessageTime,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 20
        ),
      ],
    );
  }
}
