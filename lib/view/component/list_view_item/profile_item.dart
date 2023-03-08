import 'package:flutter/material.dart';

import '../../../data/model/person.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.person});
  final Person person;
  @override
  Widget build(BuildContext context) {
    String imagePath = person.avatarPath;
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 94, 85, 96),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            person.userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          )
        ],
      ),
    );
  }
}
