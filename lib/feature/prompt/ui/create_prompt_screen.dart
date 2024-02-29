import 'package:flutter/material.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Generate Image'),
          elevation: null,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: Container(color: Colors.deepPurple)),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 150,
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your prompt',
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        print(_controller.text);
                      },
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          color: Colors.deepPurple,
                          child: Center(child: const Text('Generate'))),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
