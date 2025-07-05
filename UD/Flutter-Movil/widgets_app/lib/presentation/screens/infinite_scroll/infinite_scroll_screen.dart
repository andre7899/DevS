import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = List.generate(5, (index) => index + 1);

  final scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    scrollController.addListener(
      () {
        print('escuchando: ${scrollController.position.maxScrollExtent}');
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 500) {
          loadNextPages();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> loadNextPages() async {
    if (isLoading) return;
    print('antes de cargar: ${scrollController.position.maxScrollExtent}');
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    //TODO: revisar si esta montado el componente / widget
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
    print('despues de cargar: ${scrollController.position.maxScrollExtent}');
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels <=
        scrollController.position.maxScrollExtent - 100) return;
    // scrollController.animateTo(
    //   scrollController.position.pixels + 150,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.fastOutSlowIn,
    // );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll(List.generate(5, (index) => lastId + index + 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator.adaptive(
          onRefresh: onRefresh,
          edgeOffset: 20,
          child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                final id = imagesIds[index];

                print(index);
                return FadeInImage(
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage('https://picsum.photos/id/$id/500/300'),
                  fit: BoxFit.cover,
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(infinite: true, child: const Icon(Icons.refresh))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
