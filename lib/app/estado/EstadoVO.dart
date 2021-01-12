class EstadoVO {
  String _id;
  String _uf;

  EstadoVO(String uf){ 
    this._uf = uf; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['uf'] = uf;
    return data;
  }

  String get id => _id;

  setId(String id){
    this._id = id;
  }

  String get uf => _uf;

  setUF(String uf){
    this._uf = uf;
  }
}