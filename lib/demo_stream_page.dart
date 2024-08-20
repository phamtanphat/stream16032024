import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoStreamPage extends StatefulWidget {
  const DemoStreamPage({super.key});

  @override
  State<DemoStreamPage> createState() => _DemoStreamPageState();
}

class _DemoStreamPageState extends State<DemoStreamPage> {
  StreamController<int> controller = StreamController();
  int number = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.sink.add(number);
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

    // StreamController<int> streamNumberController = StreamController();
    //
    // StreamTransformer<int, int> streamTransformer = StreamTransformer.fromHandlers(handleData: (data, sink) {
    //   sink.add(data * 2);
    // });
    //
    // streamNumberController.stream.transform(streamTransformer).listen((event) {
    //   print(event);
    // });
    //
    // Future.delayed(Duration(seconds: 2), () {
    //   streamNumberController.sink.add(10);
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo stream page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              StreamBuilder<int>(
                stream: controller.stream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text("Number: ${snapshot.data}");
                },
              ),
              ElevatedButton(onPressed: () {
                 controller.sink.add(number++);
              }, child: Text("Increase"))
            ],
          ),
        ),
      ),
    );
  }
}
