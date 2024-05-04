import 'package:flutter/material.dart';

void main() {
  runApp(MeuMarcadorDePontosApp());
}

class MeuMarcadorDePontosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Marcador de Pontos',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MinhaPaginaInicial(),
    );
  }
}

class MinhaPaginaInicial extends StatefulWidget {
  @override
  _MinhaPaginaInicialState createState() => _MinhaPaginaInicialState();
}

class _MinhaPaginaInicialState extends State<MinhaPaginaInicial> {
  int pontuacaoTimeA = 0;
  int pontuacaoTimeB = 0;

  void _incrementarPontuacaoTimeA() {
    setState(() {
      if (pontuacaoTimeA < 12) {
        pontuacaoTimeA++;
        _verificarVencedor();
      }
    });
  }

  void _decrementarPontuacaoTimeA() {
    setState(() {
      if (pontuacaoTimeA > 0) {
        pontuacaoTimeA--;
      }
    });
  }

  void _incrementarPontuacaoTimeB() {
    setState(() {
      if (pontuacaoTimeB < 12) {
        pontuacaoTimeB++;
        _verificarVencedor();
      }
    });
  }

  void _decrementarPontuacaoTimeB() {
    setState(() {
      if (pontuacaoTimeB > 0) {
        pontuacaoTimeB--;
      }
    });
  }

  void _verificarVencedor() {
    if (pontuacaoTimeA == 12 || pontuacaoTimeB == 12) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Resultado do Jogo'),
            content: Text(pontuacaoTimeA == 12 ? 'Time A Venceu!' : 'Time B Venceu!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Reiniciar o jogo
                  setState(() {
                    pontuacaoTimeA = 0;
                    pontuacaoTimeB = 0;
                  });
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcador de Pontos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pontuação Time A: $pontuacaoTimeA',
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add, color: Colors.grey),
                  onPressed: _incrementarPontuacaoTimeA,
                ),
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.grey),
                  onPressed: _decrementarPontuacaoTimeA,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Pontuação Time B: $pontuacaoTimeB',
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add, color: Colors.grey),
                  onPressed: _incrementarPontuacaoTimeB,
                ),
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.grey),
                  onPressed: _decrementarPontuacaoTimeB,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
