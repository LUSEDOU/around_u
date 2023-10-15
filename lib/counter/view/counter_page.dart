// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:around_u/common/ui/colors.dart';
import 'package:around_u/counter/counter.dart';
import 'package:around_u/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => context.read<CounterCubit>().increment(),
      //       child: const Icon(Icons.add),
      //     ),
      //     const SizedBox(height: 8),
      //     FloatingActionButton(
      //       onPressed: () => context.read<CounterCubit>().decrement(),
      //       child: const Icon(Icons.remove),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: nav,
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextInput(
            icon: Icons.person_outline,
            hint: 'Adarsh Ranadheeran',
          ),
          SizedBox(
            height: 20,
          ),
          TextInputAlternative(
            hint: 'Mail ID',
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Botton(
              text: 'Login',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MiniBotton(text: 'Follow'),
          SizedBox(
            height: 20,
          ),
          ToggleButton(value: true),
          ToggleButton(),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          nav,
          SizedBox(
            height: 20,
          ),
          navAlter,
          // Text('$count', style: theme.textTheme.displayLarge),
        ],
      ),
    );
  }
}

class TextInputAlternative extends StatelessWidget {
  const TextInputAlternative({
    this.hint,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  final String? hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: athensLavi,
        borderRadius: BorderRadius.all(
          Radius.circular(600),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
        vertical: 8,
      ),
      child: TextField(
        keyboardType: keyboardType,
        style: TextStyle(
          color: greekGrey,
          overflow: TextOverflow.ellipsis,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    required this.icon,
    this.hint,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  final String? hint;
  final IconData icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: athensLavi,
        borderRadius: BorderRadius.all(
          Radius.circular(600),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              keyboardType: keyboardType,
              style: TextStyle(
                color: greekGrey,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Icon(
            icon,
            color: greekGrey,
          ),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    this.value = false,
    this.onChanged,
    super.key,
  });

  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: athensLavi,
      trackColor: athensLavi,
      thumbColor: greekGrey,
      value: value,
      onChanged: onChanged ?? (value) {},
    );
  }
}

class MiniBotton extends StatelessWidget {
  const MiniBotton({
    required this.text,
    this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: ribbonRed,
      shape: const StadiumBorder(),
      splashColor: scrochWhite.withOpacity(0.2),
      highlightColor: scrochWhite.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 12,
      ),
      onPressed: onPressed ?? () {},
      child: Text(
        text,
        style: TextStyle(
          color: scrochWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Botton extends StatelessWidget {
  const Botton({
    required this.text,
    this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      color: ribbonRed,
      splashColor: scrochWhite.withOpacity(0.2),
      highlightColor: scrochWhite.withOpacity(0.2),
      onPressed: onPressed ?? () {},
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 12,
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          color: scrochWhite,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

NavigationBar nav = NavigationBar(
  items: [
    NavigationBarItem(
      icon: Icons.home_outlined,
      label: 'Home',
      onPressed: () {},
    ),
    NavigationBarItem(
      icon: Icons.video_collection_outlined,
      label: 'Video',
      onPressed: () {},
    ),
    NavigationBarItem(
      icon: Icons.podcasts_outlined,
      label: 'Podcast',
      onPressed: () {},
    ),
    NavigationBarItem(
      icon: Icons.bookmark_border_outlined,
      label: 'Bookmark',
      onPressed: () {},
    ),
    NavigationBarItem(
      icon: Icons.settings_outlined,
      label: 'Settings',
      onPressed: () {},
    ),
  ],
);

NavigationBar navAlter = NavigationBar(
  items: [
    NavigationBarItem(
      icon: Icons.explore_outlined,
      label: 'Explore',
      onPressed: () {},
    ),
    NavigationBarItem(
      icon: Icons.share_outlined,
      label: 'Share',
      onPressed: () {},
    ),
    NavigationBarItem(
      icon: Icons.comment_outlined,
      label: 'Thoughts',
      onPressed: () {},
    ),
    NavigationBarItem(
      icon: Icons.bookmark_border_outlined,
      label: 'Bookmark',
      onPressed: () {},
    ),
    NavigationBarItem(
      icon: Icons.favorite_border_outlined,
      label: 'Likes',
      onPressed: () {},
    ),
  ],
);

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    required this.items,
    this.index = 0,
    super.key,
  })  : assert(index >= 0 && index < items.length, 'index out of bounds'),
        assert(items.length >= 2, 'items must be at least 2');

  final int index;
  final List<NavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 38,
        vertical: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          final isSelected = items.indexOf(item) == index;
          return _NavigationBarItem(
            item: item,
            isSelected: isSelected,
          );
        }).toList(),
      ),
    );
  }
}

class NavigationBarItem {
  const NavigationBarItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    required this.item,
    required this.isSelected,
  });

  final NavigationBarItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected ? ribbonRed : greekGrey;
    final textColor = isSelected ? scrochWhite : greekGrey;
    final color = isSelected ? ribbonRed : Colors.transparent;

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: item.onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.icon,
            color: iconColor,
            size: 32,
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(600),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 1,
            ),
            child: Text(
              item.label,
              style: TextStyle(
                fontSize: 10,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
