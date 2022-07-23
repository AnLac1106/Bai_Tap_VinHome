import 'package:flutter/material.dart';

class TextSubmitWidget extends StatefulWidget {
  const TextSubmitWidget({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
}

class _TextSubmitWidgetState extends State<TextSubmitWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    // if there is no error text
    if (_errorText == null) {
      // notify the parent widget via the onSubmit callback
      widget.onSubmit(_controller.value.text);
    }
  }

  String? get _errorText {
    final text = _controller.value.text;
    if (text.isEmpty) {
      return "Can't be empty";
    }
    if (text.length < 4) {
      return "Too short";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: 'Enter your name', errorText: _errorText),
              ),
              ElevatedButton(
                  onPressed: _controller.value.text.isNotEmpty? _submit : null,
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.headline6,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
