import 'package:sistema_para_psicologos/app/estado/EstadoDAO.dart';
import 'package:sistema_para_psicologos/app/estado/EstadoVO.dart';

class EstadoBO {
  EstadoDAO _estadoDAO;

  EstadoBO() {
    _estadoDAO = EstadoDAO();
  }

  Future<String> inserir(EstadoVO estadoVO) async{
    return _estadoDAO.inserir(estadoVO);  
  }
}