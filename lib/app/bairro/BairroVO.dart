import 'package:sistema_para_psicologos/app/cidade/CidadeVO.dart';

class BairroVO {
  String _id;
  String _bairro;
  CidadeVO _cidade;

  BairroVO(String bairro, CidadeVO cidade){
    this._bairro = bairro;
    this._cidade = cidade;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['bairro'] = bairro;
    data['idCidade'] = cidade.id;
    return data;
  }

  String get id => _id;

  setId(String id){
    this._id = id;
  }

  String get bairro => _bairro;

  setBairro(String bairro){
    this._bairro = bairro;
  }

  CidadeVO get cidade => _cidade;
}