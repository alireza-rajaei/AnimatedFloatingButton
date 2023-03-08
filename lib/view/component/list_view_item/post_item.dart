import 'package:flutter/material.dart';

import '../../../data/model/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.post,
  });
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff0d1015),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    post.person?.avatarPath ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                post.person?.userName ?? '',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz,
                color: Colors.white,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                post.imagePath ?? '',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
