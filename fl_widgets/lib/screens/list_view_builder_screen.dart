import 'package:fl_widgets/screens/screens.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      imagesIds.addAll(List.generate(10, (index) => index + imagesIds.length));
      isLoading = false;
    });
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      final lastId = imagesIds.last;
      imagesIds.clear();
      imagesIds.add(lastId + 1);
      imagesIds.addAll(List.generate(10, (index) => index + lastId + 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () => onRefresh(),
              child: ListView.builder(
                controller: scrollController,
                itemCount: imagesIds.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/loading.jpg'),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesIds[index]}/500/300'),
                  );
                },
              ),
            ),
            if (isLoading)
              Positioned(
                child: const _LoadingIndicator(),
                bottom: size.height * 0.5 - 30,
                left: size.width * 0.5 - 30,
              )
          ],
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      height: 60,
      width: 60,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    );
  }
}
