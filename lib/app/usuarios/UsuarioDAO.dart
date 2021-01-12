import 'package:sistema_para_psicologos/main.dart';
import 'package:sistema_para_psicologos/app/usuarios/UsuarioVO.dart';

class UsuarioDAO {
  UsuarioDAO() {

  }

  void inserir(UsuarioVO usuario) async{
    final docid = await MyApp.bancoDeDados.collection('usuarios').add(usuario.toJson());
    usuario.setId(docid.documentID);
    await MyApp.bancoDeDados.collection('usuarios').document(usuario.id).updateData({"id": usuario.id});
    // print("id do paciente: " + paciente.id);
    // print('$docid');
  }
}