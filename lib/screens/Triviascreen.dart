import 'dart:math';

import 'package:template/screens/colorsutil.dart';

import 'config.dart';
import 'package:flutter/material.dart';

enum Direction { left, right }

class Card {
  final int index;
  final int zIndex;
  final Direction direction;
  final Color color;
  final String title;
  final String description;

  Card({required this.title, required this.description, required this.index, required this.zIndex, required this.direction, required this.color});
}

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  final cards = [
    Card(
        index: 0,
        zIndex: 0,
        direction: Direction.left,
        color: Colors.green,
        title: "Flutter build",
        description:
            "Flutter is an open-source UI software development toolkit created by Google that allows developers to build natively compiled applications for mobile, web, and desktop from a single codebase."),
    Card(
        index: 1,
        zIndex: 1,
        direction: Direction.left,
        color: Colors.brown,
        title: "Homework",
        description: "Complete homework assignments for various subjects."),
    Card(
        index: 2,
        zIndex: 2,
        direction: Direction.left,
        color: Colors.blue,
        title: "Riverpod",
        description:
            "Riverpod is a state management library for Flutter that is simple, intuitive, and based on Provider, designed to handle dependency injection and state management in your Flutter applications."),
    Card(
        index: 3,
        zIndex: 3,
        direction: Direction.left,
        color: Colors.red,
        title: "Data Structure",
        description: "Study data structures and algorithms to efficiently organize and manipulate data in computer science."),
    Card(
        index: 4,
        zIndex: 4,
        direction: Direction.left,
        color: Colors.indigo,
        title: "Leetcode",
        description: "Practice coding problems on LeetCode to improve your algorithmic problem-solving skills."),
    Card(
        index: 5,
        zIndex: 5,
        direction: Direction.left,
        color: Colors.orange,
        title: "Placeholder",
        description: "You can add more cards for other topics or tasks as needed.")
  ];

  @override
  Widget build(BuildContext context) {
    final sorted = List<Card>.from(cards)..sort(((a, b) => b.zIndex.compareTo(a.zIndex)));
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Padding(
            padding: Config.contentPadding(v: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: Config.contentPadding(h: 20),
                  child: Row(
                    children: [
                      Text('List of Work', style: TextStyle(color: textColor, fontSize: 30)),
                      Divider(
                        thickness: 2,
                      ),
                      const Spacer(),
                      //const Circle(),
                      Config.hGap20,
                      //const Circle(),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: sorted
                        .map((e) => StackedCard(
                              card: e,
                              updateIndex: (swiped) {
                                cards[swiped.index] = swiped;
                                final right = cards.where((e) => e.direction == Direction.right);
                                final left = cards.where((e) => e.direction == Direction.left);

                                if ((swiped.direction == Direction.right && left.isNotEmpty) ||
                                    (swiped.direction == Direction.left && right.isNotEmpty)) {
                                  for (int i = 0; i < cards.length; i++) {
                                    switch (swiped.direction) {
                                      case Direction.left:
                                        if (right.any((e) => e.index == cards[i].index)) {
                                          cards[i] = Card(
                                              index: cards[i].index,
                                              zIndex: cards[i].zIndex - 1,
                                              direction: cards[i].direction,
                                              color: cards[i].color,
                                              title: cards[i].title,
                                              description: cards[i].description);
                                        } else {
                                          cards[i] = Card(
                                              index: cards[i].index,
                                              zIndex: cards[i].zIndex + 1,
                                              direction: cards[i].direction,
                                              color: cards[i].color,
                                              title: cards[i].title,
                                              description: cards[i].description);
                                        }
                                        break;
                                      case Direction.right:
                                        if (left.any((e) => e.index == cards[i].index)) {
                                          cards[i] = Card(
                                              index: cards[i].index,
                                              zIndex: cards[i].zIndex - 1,
                                              direction: cards[i].direction,
                                              color: cards[i].color,
                                              title: cards[i].title,
                                              description: cards[i].description);
                                        } else {
                                          cards[i] = Card(
                                              index: cards[i].index,
                                              zIndex: cards[i].zIndex + 1,
                                              direction: cards[i].direction,
                                              color: cards[i].color,
                                              title: cards[i].title,
                                              description: cards[i].description);
                                        }
                                    }
                                  }
                                  setState(() {});
                                }
                              },
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: Config.contentPadding(h: 40),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Circle(),
                      Circle(),
                      Circle(),
                      Circle(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StackedCard extends StatefulWidget {
  const StackedCard({
    super.key,
    required this.card,
    required this.updateIndex,
  });

  final Card card;
  final void Function(Card) updateIndex;

  @override
  State<StackedCard> createState() => _StackedCardState();
}

class _StackedCardState extends State<StackedCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotate;

  bool isFlipped = false;
  Offset offset = Offset.zero;
  double height = 330;
  double width = 260;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    _rotate = Tween<double>(begin: pi, end: 0.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final i = widget.card.zIndex;
    final isLeft = widget.card.direction == Direction.left;

    final tiltAngle = (i * 3.5) * (3.14 / 180);
    return Transform.translate(
      offset: isLeft ? Offset(offset.dx - (i * (30 - (i * 2))), 0) : Offset(offset.dx + (i * (30 - (i * 2))), 0),
      child: Transform.rotate(
        angle: offset == Offset.zero
            ? isLeft
                ? -tiltAngle
                : tiltAngle
            : (offset.dx / 15) * (3.14 / 180),
        child: GestureDetector(
          onTap: () {
            if (i != 0) return;
            isFlipped = !isFlipped;
            isFlipped ? _controller.forward() : _controller.reverse();
          },
          onHorizontalDragUpdate: (details) {
            if (i != 0 || isFlipped) return;
            setState(() {
              offset = Offset(details.localPosition.dx - 260 / 2, 0);
              height = 330 - min(40, offset.dx.abs());
              width = 260 - min(40, offset.dx.abs());
            });
          },
          onHorizontalDragEnd: (details) {
            if (i != 0 || isFlipped) return;
            final direction = offset.dx > 80
                ? Direction.right
                : offset.dx < -80
                    ? Direction.left
                    : widget.card.direction;

            if (offset.dx.abs() > 80) {
              widget.updateIndex(Card(
                  index: widget.card.index,
                  zIndex: widget.card.zIndex,
                  direction: direction,
                  color: widget.card.color,
                  description: widget.card.description,
                  title: widget.card.title));
            }
            setState(() {
              offset = Offset.zero;
              height = 330;
              width = 260;
            });
          },
          child: AnimatedBuilder(
            animation: _rotate,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.rotationY(_rotate.value)..setEntry(3, 0, 0),
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: isFlipped ? Config.height * 0.7 : Config.y(height - (i * 25)),
                  width: isFlipped ? Config.width : Config.x(width - (i * 25)),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.onPrimary, width: 0.5),
                    borderRadius: BorderRadius.circular(25),
                    color: widget.card.color,
                  ),
                  child: Center(
                    child: _rotate.value < (pi / 2)
                        ? Text(widget.card.description, style: Config.textTheme.titleLarge)
                        : Transform(
                            transform: Matrix4.rotationY(_rotate.value),
                            alignment: Alignment.center,
                            child: Text(widget.card.title, style: Config.textTheme.titleSmall),
                          ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: 10,
      backgroundColor: colorScheme.primary,
    );
  }
}
