import 'package:sistema_para_psicologos/app/endereco/EnderecoDAO.dart';
import 'package:sistema_para_psicologos/app/endereco/EnderecoVO.dart';

class EnderecoBO{
  EnderecoDAO _enderecoDAO;

  EnderecoBO(){
    _enderecoDAO = EnderecoDAO();
  }

  Future<String> inserir(EnderecoVO enderecoVO) async{
    return _enderecoDAO.inserir(enderecoVO);  
  }
}