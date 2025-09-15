import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Tela de marcador de placar para partidas de volei
class ScorefVolleyballPage extends StatefulWidget {
  const ScorefVolleyballPage({super.key});

  @override
  State<ScorefVolleyballPage> createState() => _ScorefVolleyballPageState();
}

class _ScorefVolleyballPageState extends State<ScorefVolleyballPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.restart_alt_rounded),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Configurações"),
                  );
                },
              );
            },
            icon: Icon(Icons.pending_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Text("data")
      ),
    );
  }
}
