import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/game_provider.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  @override
  void didChangeDependencies(){
    Provider.of<GameProvider>(context, listen:false).init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Let's Play Tic Tac Toe!",
                style: TextStyle(fontSize:50),
              ),
              Expanded(
                child: SizedBox(
                  width:MediaQuery.of(context).size.width * 0.35,
                  child: Consumer<GameProvider>(
                  builder: (context, provider, child) => GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4),
                      itemCount: 9,
                      itemBuilder:(context, index){
                        return GestureDetector(
                          onTap: () {
                            provider.chooseTile(index);
                          },
                          child: Card(
                            child: Center(
                              child: Text(
                                provider.tiles[index].toString(),
                                style: TextStyle(fontSize: 45),
                              ),
                            ),
                          ),
                        );
                      }),
                  ),
                ),
              ),
              Consumer<GameProvider>(
                builder: (context, provider, child) => Text(
                  provider.bottomText(),
                  style: TextStyle(fontSize: 40),
                )
              )
            ],
          ),
          Consumer<GameProvider>(
            builder: (context, provider, child) => ElevatedButton(
              onPressed: provider.reset, 
              child: Text("Reset Game!"))
            ),
        ],
      ),
    );
  }
}

