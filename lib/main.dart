import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistema_para_psicologos/app/dashboard/Dashboard.dart';
import 'package:sistema_para_psicologos/app/home/Home.dart';
import 'package:sistema_para_psicologos/app/login/Login.dart';
import 'package:sistema_para_psicologos/app/pacientes/CadastrarPaciente.dart';
import 'package:sistema_para_psicologos/app/splash/Splash.dart';
import 'package:sistema_para_psicologos/app/usuarios/UsuarioVO.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  static final Firestore bancoDeDados = Firestore.instance;
  // static UsuarioVO usuarioLogado;
  static String idUsuarioLogado = "";

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> rotas = {
      'home':(_)=> Home(),
      'login':(_)=>Login(),
      'dashboard':(_)=>Dashboard(),
      'cadastrarPaciente':(_)=>CadastrarPaciente()
    };

    return MaterialApp(
      home: Splash(),
      routes: rotas,
      debugShowCheckedModeBanner: false
    );
  }
}