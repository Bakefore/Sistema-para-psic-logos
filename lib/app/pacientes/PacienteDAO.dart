import 'dart:convert';
import 'package:sistema_para_psicologos/app/pacientes/PacienteVO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistema_para_psicologos/main.dart';

class PacienteDAO {  

  PacienteDAO(){
    
  }

  void inserir(PacienteVO paciente) async{
    final docid = await MyApp.bancoDeDados.collection('pacientes').add(paciente.toJson());
    paciente.setId(docid.documentID);
    await MyApp.bancoDeDados.collection('pacientes').document(paciente.id).updateData({"id": paciente.id});
    // print("id do paciente: " + paciente.id);
    // print('$docid');
  }
}