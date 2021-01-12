import 'package:flutter/material.dart';
import 'package:sistema_para_psicologos/app/compartilhado/TelaSTL.dart';
import 'package:sistema_para_psicologos/app/pacientes/CadastrarPaciente.dart';
import 'package:sistema_para_psicologos/app/pacientes/PacientesMenu.dart';

class Dashboard extends TelaSTL {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema para psicólogos"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: Form(
          child: Column(
            children: <Widget>[
              criar_btn("Pacientes", "lib/images/cadastrarFuncionario100px.png", (){
                chamarNavigator(context, Pacientes());
              }),
              criar_btn("Consultas", "lib/images/atividade100px.png", (){
                // chamarNavigator(context, CadastrarPaciente());
              }),              
            ],
          ),
        ),
      ),
    );
  }
}
