import 'package:flutter/material.dart';
import 'package:flutter_application_1/second_page_provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200));
  late Animation<int> animation =
      Tween<int>(begin: 0, end: 1).animate(_controller);

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.isDismissed) {
        _controller.forward();
      }
    });
    // animation = Tween(begin: 0, end: 1).animate(_controller);
    _controller.drive(Tween(begin: 0, end: 1));

    print(_controller.value);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_controller.isAnimating) {
      _controller.forward();
    }
    print('111');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SecondPageProvider>(context, listen: true);
    List<Map<int, String>> result11 = [];

    Future<List<Map<int, String>>> futureProvider() async {
      print(_controller.value);

      return await Future.delayed(const Duration(seconds: 1), () async {
        var result = await provider.filterTheList(provider.numberOfList);
        result11 = result;
        return result;
      });
      // print(_controller.value);

      // return result;
    }

    provider.addListener(() {
      if (_controller.isCompleted) {
        _controller.forward();
      }
    });
    var result = futureProvider();

    Future<dynamic> result1() async {
      result11 = await Future<List<Map<int, String>>>.value(futureProvider());
    }

    void startTheAnimation(String index) {
      _controller.reverse();
      Future.delayed(const Duration(milliseconds: 200),
          () => provider.changeTheNumberOfList(index));
    }

    // var result1 = result.then((value) => );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => startTheAnimation('1'),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey[400]),
                    child: Text('1'),
                  ),
                ),
                GestureDetector(
                  onTap: () => startTheAnimation('2'),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey[400]),
                    child: Text('2'),
                  ),
                ),
                GestureDetector(
                  onTap: () => startTheAnimation('3'),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey[400]),
                    child: Text('3'),
                  ),
                ),
                GestureDetector(
                  onTap: () => startTheAnimation('4'),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey[400]),
                    child: Text('4'),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: result,
              initialData: 'dasdasd',
              builder: (context, snapshot) {
                Widget? child11;
                result1();

                var data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  child11 = SizedBox(
                    width: 400,
                    height: 100,
                    child: ListView.builder(
                      itemCount: result11.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result11[index][1]!),
                            Text(result11[index][2]!),
                            Text(result11[index][3]!),
                          ],
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  child11 = const Text('there we not go');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  child11 = const Text('pending');
                }
                return Center(
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child1) {
                      return Opacity(
                          opacity: _controller.value, child: child11!);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
