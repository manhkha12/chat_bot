import 'package:flutter/material.dart';
import 'package:smart_home/features/home_page/home_page_screen.dart';
import 'package:smart_home/gen/assets.gen.dart';
import 'package:smart_home/shared/widgets/app_layout.dart';

class ChatMessageScreen extends StatelessWidget {
  const ChatMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(child: ReturnBox()),
                      SizedBox(child: Assets.icons.dotHorizontal.svg(),)
                    ],
                  )
                ]))));
  }
}
