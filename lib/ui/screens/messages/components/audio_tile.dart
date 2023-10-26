import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/material.dart';

class AudioMessageWidget extends StatelessWidget {
  final String duration;
  final bool isSender;

  const AudioMessageWidget({super.key, 
    required this.duration,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSender? MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: isSender ? kPrimaryColor : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12.0),
              topRight: const Radius.circular(12.0),
              bottomLeft: Radius.circular(isSender ? 12.0 : 0.0),
              bottomRight: Radius.circular(isSender ? 0.0 : 12.0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 36.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                duration,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
