import 'package:sistema_para_psicologos/app/cidade/CidadeDAO.dart';
import 'package:sistema_para_psicologos/app/cidade/CidadeVO.dart';

class CidadeBO{
  CidadeDAO _cidadeDAO;
  
  CidadeBO(){
    _cidadeDAO = CidadeDAO();
  }

  Future<String> inserir(CidadeVO cidadeVO) async{
    return _cidadeDAO.inserir(cidadeVO);  
  }
}