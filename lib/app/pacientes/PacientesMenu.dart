import 'package:flutter/material.dart';
import 'package:sistema_para_psicologos/app/compartilhado/TelaSTL.dart';
import 'package:sistema_para_psicologos/app/pacientes/CadastrarPaciente.dart';

class Pacientes extends TelaSTL {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pacientes"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: Form(
          child: Column(
            children: <Widget>[
              criar_btn("Cadastrar Paciente", "lib/images/cadastrarFuncionario100px.png", (){
                chamarNavigator(context, CadastrarPaciente());
              }),
              criar_btn("Pesquisar Paciente", "lib/images/pesquisar100px.png", (){
                chamarNavigator(context, CadastrarPaciente());
              }),              
            ],
          ),
        ),
      ),
    );
  }
}
