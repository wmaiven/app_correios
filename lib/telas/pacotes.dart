import 'package:correios/repositories/pacote_repository.dart';
import 'package:correios/telas/mostrar_pacote.dart';
import 'package:flutter/material.dart';

import '../models/pacote.dart';
import 'adicionar.dart';

class Pacotes extends StatefulWidget {
  const Pacotes({Key? key}) : super(key: key);

  @override
  State<Pacotes> createState() => _PacotesState();
}

class _PacotesState extends State<Pacotes> {
  mostrarPacote(Pacote pacote){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MostrarPacote(pacote: pacote),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabela = PacoteRepository.tabela;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Pacotes',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int pacote){
          return Dismissible(
            child: ListTile(
              leading: Image.asset(tabela[pacote].icone),
              title: Text("Pacote: ${tabela[pacote].codigoRast}",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text("${tabela[pacote].peso.toString()}Kg",
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
              onLongPress: (){},
              onTap: () => mostrarPacote(tabela[pacote]),
            ),
            key: Key(tabela[pacote].codigoRast),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AdicionarNovoPacote(),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.amber,
      ),
    );
  }
}