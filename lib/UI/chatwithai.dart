import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  runApp(new ChatWithUI());
}

class ChatWithUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatWithUIState();
}

class ChatWithUIState extends State<ChatWithUI> {
  var edittext = TextEditingController();

  String getAPIKEY() {
    return 'AIzaSyApb1YmdJQz34j1rJYk0ps5Q2ZC3jd73oI';
  }

  Future<String> getResponseFromGemini(String text) async {
    // Ensure the API key is properly set

    // The Gemini 1.5 models are versatile and work with both text-only and multimodal prompts
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: getAPIKEY(),
    );
    final content = [Content.text(text)];
    final response = await model.generateContent(content);
    return response.text ?? 'No response';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: TextField(
                        controller: edittext,
                        decoration: InputDecoration(
                          hintText: 'Nhập nội dung',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(2.0),
                      padding: EdgeInsets.all(2.0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.blueAccent,
                        hoverColor: Colors.lightBlueAccent,
                        child: Text('Gửi'),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
