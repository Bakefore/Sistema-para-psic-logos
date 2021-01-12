import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistema_para_psicologos/app/endereco/EnderecoVO.dart';
import 'package:sistema_para_psicologos/main.dart';

class EnderecoDAO {

  EnderecoDAO(){

  }

  Future<String> inserir(EnderecoVO endereco) async{    
    final docid = await MyApp.bancoDeDados.collection('endereco').add(endereco.toJson());
    endereco.setId(docid.documentID);
    await MyApp.bancoDeDados.collection('endereco').document(endereco.id).updateData({"id": endereco.id});
    return endereco.id;
  }
}