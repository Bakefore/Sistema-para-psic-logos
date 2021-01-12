import 'package:sistema_para_psicologos/app/usuarios/UsuarioDAO.dart';
import 'package:sistema_para_psicologos/app/usuarios/UsuarioVO.dart';

class UsuarioBO {
  UsuarioDAO _usuarioDAO;

  UsuarioBO() {
    _usuarioDAO = UsuarioDAO();
  }

  Future<void> inserir(UsuarioVO usuarioVO) async{
    _usuarioDAO.inserir(usuarioVO);  
  }
}