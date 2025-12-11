import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/utils/enums/feature_enum.dart';

class LoadingSkeletonList extends StatelessWidget {
  const LoadingSkeletonList({super.key, required this.feature});

  final Feature feature;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: feature == Feature.notes ? 7 : 12,
      itemBuilder: (_, __) => _loadingSkeletonItem(),
    );
  }

  Container _loadingSkeletonItem() {
    return Container(
      height: feature == Feature.notes ? 200 : 100,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 14,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
