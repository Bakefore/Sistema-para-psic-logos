import 'package:sistema_para_psicologos/app/estado/EstadoVO.dart';

class CidadeVO {
  String _id;
  String _cidade;
  EstadoVO _estado;

  CidadeVO(String cidade, EstadoVO estado){
    this._cidade = cidade;
    this._estado = estado;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['cidade'] = cidade;
    data['idEstado'] = estado.id;
    return data;
  }

  String get id => _id;

  setId(String id){
    this._id = id;
  }

  String get cidade => _cidade;

  setCidade(String cidade){
    this._cidade = cidade;
  }

  EstadoVO get estado => _estado;
}