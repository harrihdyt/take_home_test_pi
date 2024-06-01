import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 4),
            blurRadius: 8,
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.8),
              highlightColor: Colors.grey.withOpacity(0.5),
              direction: ShimmerDirection.ttb,
              loop: 60,
              child: Container(
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 20,
                  decoration: const BoxDecoration(),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.8),
                    highlightColor: Colors.grey.withOpacity(0.5),
                    direction: ShimmerDirection.ttb,
                    loop: 60,
                    child: Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  height: 20,
                  decoration: const BoxDecoration(),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.8),
                    highlightColor: Colors.grey.withOpacity(0.5),
                    direction: ShimmerDirection.ttb,
                    loop: 60,
                    child: Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 120,
                  height: 20,
                  decoration: const BoxDecoration(),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.8),
                    highlightColor: Colors.grey.withOpacity(0.5),
                    direction: ShimmerDirection.ttb,
                    loop: 60,
                    child: Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
