import 'package:sistema_para_psicologos/app/bairro/BairroVO.dart';
import 'package:sistema_para_psicologos/main.dart';

class BairroDAO {
  BairroDAO(){

  }

  Future<String> inserir(BairroVO bairro) async{    
    final docid = await MyApp.bancoDeDados.collection('bairro').add(bairro.toJson());
    bairro.setId(docid.documentID);
    await MyApp.bancoDeDados.collection('bairro').document(bairro.id).updateData({"id": bairro.id});
    return bairro.id;
  }
}