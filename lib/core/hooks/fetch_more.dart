import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController useFetchMore(FutureOr<void> Function() onFetchMore) {
  final scrollController = useScrollController();

  useEffect(() {
    void onScroll() {
      bool isBottom() {
        if (!scrollController.hasClients) return false;
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;
        return currentScroll >= (maxScroll * 0.9);
      }

      if (isBottom()) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onFetchMore();
        });
      }
    }

    scrollController.addListener(onScroll);

    return () => scrollController.removeListener(onScroll);
  }, []);

  return scrollController;
}
