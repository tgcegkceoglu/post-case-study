import 'package:flutter/material.dart';
import 'package:flutter_post_case_study/core/constants/lottie_constants.dart';
import 'package:flutter_post_case_study/core/enums/api_state.dart';

// API çağrılarının durumuna göre farklı UI göstermek için kullanılır.
class StateHandlerWidget extends StatelessWidget {
  final ApiState state;
  final Widget child;

  const StateHandlerWidget({
    super.key,
    required this.state,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ApiState.loading:
        return Center(child: LottieConstants.loading.toLottie);
      case ApiState.error:
        return Center(child: LottieConstants.error.toLottie);
      case ApiState.notFound:
        return Center(child: LottieConstants.notFound.toLottie);

      case ApiState.success:
        return child;
    }
  }
}
