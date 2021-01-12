import 'package:sistema_para_psicologos/app/estado/EstadoVO.dart';
import 'package:sistema_para_psicologos/main.dart';

class EstadoDAO {
  EstadoDAO(){

  }

  Future<String> inserir(EstadoVO estado) async{    
    final docid = await MyApp.bancoDeDados.collection('estado').add(estado.toJson());
    estado.setId(docid.documentID);
    await MyApp.bancoDeDados.collection('estado').document(estado.id).updateData({"id": estado.id});
    return estado.id;
  }
}