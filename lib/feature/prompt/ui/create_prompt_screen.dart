import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_generation/feature/prompt/bloc/prompt_bloc.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  TextEditingController _controller = TextEditingController();
  final PromptBloc _promptBloc = PromptBloc();

  @override
  void initState() {
    _promptBloc.add(PromptInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Generate Image'),
          elevation: null,
          centerTitle: true,
        ),
        body: BlocConsumer<PromptBloc, PromptState>(
          bloc: _promptBloc,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case PromptGeneratingImageLoadState:
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: Column(
                          children: [
                            TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your prompt',
                              ),
                            ),
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () {
                                if (_controller.text.isNotEmpty) {
                                  _promptBloc.add(
                                      PromptEnteredEvent(_controller.text));
                                }
                              },
                              child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  color: Colors.deepPurple,
                                  child: const Center(child: Text('Generate'))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              case PromptGeneratingImageErrorState:
                return const Center(
                  child: Text('Error'),
                );
              case PromptGeneratingImageSuccessState:
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: MemoryImage(
                                    (state as PromptGeneratingImageSuccessState)
                                        .uint8list),
                                fit: BoxFit.cover)),
                      )),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: Column(
                          children: [
                            TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your prompt',
                              ),
                            ),
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () {
                                if (_controller.text.isNotEmpty) {
                                  _promptBloc.add(
                                      PromptEnteredEvent(_controller.text));
                                }
                              },
                              child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  color: Colors.deepPurple,
                                  child: const Center(child: Text('Generate'))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              default:
                return const Center(
                  child: Text('Error'),
                );
            }
          },
        ));
  }
}
