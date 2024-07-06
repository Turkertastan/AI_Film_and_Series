import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dart_openai/dart_openai.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _questionController = TextEditingController();
  List<String> _answerWords = [];
  GlobalKey _animatedTextKey = GlobalKey();

  Future<String> filmleriGetir({required String prompt}) async {
    OpenAIChatCompletionModel completion = await OpenAI.instance.chat.create(
      maxTokens: 50,
      model: "gpt-3.5-turbo-1106",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.assistant,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              "Sen dizi/film öneren bir asistansın ve yalnızca film ve dizinin adını yazarsın.",
            ),
          ],
        ),
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              prompt,
            ),
          ],
        ),
      ],
    );

    final String? film = completion.choices.first.message.content?.first.text;

    return film ?? "Hiç bir sonuç bulunamadı";
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _animatedTextKey = GlobalKey();
  }

  Widget _buildTabContent(String category) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/dorduncu.jpg"),
          fit: BoxFit.cover,
        ),
        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              key: _animatedTextKey,
              onNext: (p0, p1) {
                print(p0);
                print(p1);
              },
              animatedTexts: [
                TyperAnimatedText(
                  _answerWords.join(' '),
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 25),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow.shade400),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        controller: _questionController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "İstediğiniz Filmi Söyleyin",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () async {
                      final film = await filmleriGetir(
                        prompt: _questionController.text.trim(),
                      );

                      setState(() {
                        _answerWords = film.split(' ');
                        _animatedTextKey = GlobalKey();
                      });
                    },
                    icon: const Icon(Icons.arrow_forward),
                    color: Colors.yellow.shade400,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Dizi',
                    icon: Icon(Icons.tv,
                        color: _tabController.index == 0
                            ? Colors.yellow.shade400
                            : Colors.white),
                  ),
                  Tab(
                    text: 'Film',
                    icon: Icon(Icons.movie,
                        color: _tabController.index == 0
                            ? Colors.yellow.shade400
                            : Colors.white),
                  ),
                ],
                labelColor: Colors.yellow.shade400, // Seçili tab'ın metin rengi
                unselectedLabelColor:
                    Colors.white, // Seçili olmayan tab'ların metin rengi
                indicatorColor: Colors.yellow
                    .shade400, // Seçili tabın altındaki gösterge çizgisinin rengi
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent('Dizi'),
          _buildTabContent('Film'),
        ],
      ),
    );
  }
}
