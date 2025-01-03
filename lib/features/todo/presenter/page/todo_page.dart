import 'package:flutter/material.dart';
import 'package:taski/utils/constants.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kPaddingDefault,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kPaddingDefault, top: kPaddingDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: kPaddingDefault / 3,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Welcome, ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'John',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Text(
                'You’ve got 7 tasks to do.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primaryFixed,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: kPaddingDefault, vertical: kPaddingDefault / 2),
                    padding: const EdgeInsets.all(kPaddingDefault),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(kPaddingDefault),
                    ),
                    child: Column(
                      spacing: kPaddingDefault / 3,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kPaddingDefault / 2),
                                border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).colorScheme.inversePrimary,
                                ),
                              ),
                            ),
                            SizedBox(width: kPaddingDefault),
                            Text(
                              'Design sign up flow',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 25 + kPaddingDefault),
                            Expanded(
                              child: Text(
                                'By the time a prospect arrives at your signup page, in most cases, they’ve already '
                                    'By the time a prospect arrives at your signup page, in most cases.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.primaryFixed,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.0),
                        Colors.white.withValues(alpha: 0.9),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
