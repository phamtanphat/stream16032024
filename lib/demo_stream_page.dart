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
    Stream<int> streamNumber = Stream.periodic(Duration(seconds: 1), (count) {
      return count + 1;
    });

    streamNumber.listen((event) {
      print(event);
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
