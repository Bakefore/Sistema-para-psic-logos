import 'package:sistema_para_psicologos/app/cidade/CidadeVO.dart';
import 'package:sistema_para_psicologos/main.dart';

class CidadeDAO {
  CidadeDAO(){

  }

  Future<String> inserir(CidadeVO cidade) async{    
    final docid = await MyApp.bancoDeDados.collection('cidade').add(cidade.toJson());
    cidade.setId(docid.documentID);
    await MyApp.bancoDeDados.collection('cidade').document(cidade.id).updateData({"id": cidade.id});
    return cidade.id;
  }
}