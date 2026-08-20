import 'package:flutter/material.dart';
import 'package:movieflex/models/profile_option.dart';

class ProfileOptionTile extends StatelessWidget {
  final ProfileOption option;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProfileOptionTile({
    super.key,
    required this.option,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      leading: Icon(option.icon, color: Colors.black, size: 24),
      title: Text(
        option.title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing:
          trailing ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (option.subtitle != null) ...[
                Text(
                  option.subtitle!,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 6),
              ],
              const Icon(Icons.chevron_right, color: Colors.black),
            ],
          ),
    );
  }
}
