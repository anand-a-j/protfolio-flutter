import 'package:flutter/material.dart';

import '../../../core/utils/app_consts.dart';
import '../../../core/widgets/title_rich_text.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height / 2,
      width: width,
      color: Colors.red,
      margin: const EdgeInsets.symmetric(
        horizontal: AppConsts.pWebSide,
        // vertical: AppConsts.pWebVeritical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleRichText(
            titleOne: "Technical",
            titleTwo: "Skills",
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              ContinuousScrollPage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: Offset(-4, 0),
                    child: BlackFadeContainer(),
                  ),
                  Transform.translate(
                    offset: Offset(4, 0),
                    child: BlackFadeContainer(isLeftToRight: false),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContinuousScrollPage extends StatefulWidget {
  @override
  _ContinuousScrollPageState createState() => _ContinuousScrollPageState();
}

class _ContinuousScrollPageState extends State<ContinuousScrollPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollSpeed = 50; // pixels per second

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() async {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double pixels = _scrollController.offset;

    while (mounted) {
      await Future.delayed(Duration(milliseconds: 16));
      pixels += _scrollSpeed * 0.016; // 16ms frame
      if (pixels >= maxScroll) {
        pixels = 0; // loop back to start
      }
      _scrollController.jumpTo(pixels);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 20, // number of cards
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xff3d3d3d),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 1,
                color: Colors.grey.shade600,
              ),
            ),
            child: Center(
              child: Text(
                'Card $index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class BlackFadeContainer extends StatelessWidget {
  const BlackFadeContainer({
    super.key,
    this.isLeftToRight = true,
  });

  final bool isLeftToRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: isLeftToRight ? Alignment.centerLeft : Alignment.centerRight,
          end: !isLeftToRight ? Alignment.centerLeft : Alignment.centerRight,
          colors: [
            Colors.black,
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.0),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
