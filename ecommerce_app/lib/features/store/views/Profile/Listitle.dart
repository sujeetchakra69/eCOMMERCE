import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,  this.icon, required this.title, required this.subtitle,  this.trailing, this.onPressed,
  });
  final IconData? icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        
        leading: Icon(icon ),
        title: Text(title),
        subtitle: Text(subtitle),
        tileColor: Colors.grey[100],
        trailing: trailing,
        onTap: onPressed,
        
      ),
      
    );
  }
}
