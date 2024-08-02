import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../model/booking_steps.dart';

class SelectGuestsWidget extends StatefulWidget {
  const SelectGuestsWidget({
    super.key,
    required this.step, required Null Function(dynamic guestCount) onGuestCountSelected,
  });

  final BookingSteps step;

  @override
  _SelectGuestsWidgetState createState() => _SelectGuestsWidgetState();
}

class _SelectGuestsWidgetState extends State<SelectGuestsWidget> {
  int _adults = 0;
  int _children = 0;
  int _infants = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        height: widget.step == BookingSteps.selectGuest ? 274 : 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        duration: const Duration(milliseconds: 300),
        child: widget.step == BookingSteps.selectGuest
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who\'s coming?',
              style: textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 190,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  _buildGuestsQuanitySelector(
                    context,
                    'Adults',
                    'Ages 13 or above',
                        () {
                      setState(() {
                        _adults--;
                      });
                    },
                        () {
                      setState(() {
                        _adults++;
                      });
                    },
                    _adults.toString(),
                  ),
                  const Divider(),
                  _buildGuestsQuanitySelector(
                    context,
                    'Children',
                    'Ages 2-12',
                        () {
                      setState(() {
                        _children--;
                      });
                    },
                        () {
                      setState(() {
                        _children++;
                      });
                    },
                    _children.toString(),
                  ),
                  const Divider(),
                  _buildGuestsQuanitySelector(
                    context,
                    'Infants',
                    'Under 2',
                        () {
                      setState(() {
                        _infants--;
                      });
                    },
                        () {
                      setState(() {
                        _infants++;
                      });
                    },
                    _infants.toString(),
                  ),
                ],
              ),
            ),
          ],
        )
            .animate(delay: const Duration(milliseconds: 300))
            .fadeIn(duration: const Duration(milliseconds: 300))
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Who',
              style: textTheme.bodyMedium,
            ),
            Text(
              'Add guests',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildGuestsQuanitySelector(
      BuildContext context,
      String title,
      String subtitle,
      VoidCallback onDecrement,
      VoidCallback onIncrement,
      String value,
      ) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.bodyLarge),
              Text(subtitle, style: textTheme.bodySmall),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove),
              ),
              Text(
                value,
                style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}