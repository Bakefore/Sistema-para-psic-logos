import 'package:sistema_para_psicologos/app/pacientes/PacienteDAO.dart';
import 'package:sistema_para_psicologos/app/pacientes/PacienteVO.dart';

class PacienteBO {
  PacienteDAO _pacienteDAO;
  
  PacienteBO(){
    _pacienteDAO = PacienteDAO();
  }

  Future<void> inserir(PacienteVO pacienteVO) async{
    _pacienteDAO.inserir(pacienteVO);  
  }
}