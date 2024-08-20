import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoStreamPage extends StatefulWidget {
  const DemoStreamPage({super.key});

  @override
  State<DemoStreamPage> createState() => _DemoStreamPageState();
}

class _DemoStreamPageState extends State<DemoStreamPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 1: Dung formFuture
    // Stream<int> streamNumber = Stream.fromFuture(Future.value(10));
    
    // 2: Dung iterable
    // Stream<int> streamNumber = Stream.fromIterable(Iterable.generate(10, (index) => index));

    // 3: Dung periodic
    // Stream<int> streamNumber = Stream.periodic(Duration(seconds: 1), (count) {
    //   return count + 1;
    // });

    // var subscription = streamNumber.listen((event) {
    //   print(event);
    // });

    StreamController<int> streamNumberController = StreamController();

    StreamTransformer<int, int> streamTransformer = StreamTransformer.fromHandlers(handleData: (data, sink) {
      sink.add(data * 2);
    });

    streamNumberController.stream.transform(streamTransformer).listen((event) {
      print(event);
    });

    Future.delayed(Duration(seconds: 2), () {
      streamNumberController.sink.add(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo stream page"),
      ),
      body: Container(),
    );
  }
}
