import 'package:sistema_para_psicologos/app/bairro/BairroDAO.dart';
import 'package:sistema_para_psicologos/app/bairro/BairroVO.dart';

class BairroBO {
  BairroDAO _bairroDAO;

  BairroBO() {
    _bairroDAO = BairroDAO();
  }

  Future<String> inserir(BairroVO bairroVO) async{
    return _bairroDAO.inserir(bairroVO);  
  }
}