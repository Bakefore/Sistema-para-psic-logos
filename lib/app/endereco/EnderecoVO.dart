import 'package:sistema_para_psicologos/app/bairro/BairroVO.dart';

class EnderecoVO {
  String _id;
  String _cep, _rua, _complemento;
  int _numero;
  BairroVO _bairro;

  EnderecoVO(String cep, String rua, int numero, String complemento, BairroVO bairro){
    this._cep = cep; 
    this._rua = rua; 
    this._numero = numero; 
    this._complemento = complemento;
    this._bairro = bairro;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['cep'] = cep;
    data['numero'] = numero;
    data['complemento'] = complemento;
    data['idBairro'] = bairro.id;
    return data;
  }

  String get id => _id;

  setId(String id){
    this._id = id;
  }

  String get cep => _cep;

  setCep(String cep){
    this._cep = cep;
  }

  String get rua => _rua;

  setRua(String rua){
    this._rua = rua;
  }

  int get numero => _numero;

  setNumero(int numero){
    this._numero = numero;
  }

  String get complemento => _complemento;

  setComplemento(String complemento){
    this._complemento = complemento;
  }

  BairroVO get bairro => _bairro;
}