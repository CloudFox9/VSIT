class BobUser {
  String? aud;
  String? iss;
  int? iat;
  int? nbf;
  int? exp;
  String? acr;
  String? aio;
  List<String>? amr;
  String? appid;
  String? appidacr;
  String? email;
  String? familyName;
  String? givenName;
  String? idp;
  String? ipaddr;
  String? name;
  String? oid;
  String? rh;
  String? scp;
  String? sub;
  String? tid;
  String? uniqueName;
  String? uti;
  String? ver;

  BobUser(
      {this.aud,
      this.iss,
      this.iat,
      this.nbf,
      this.exp,
      this.acr,
      this.aio,
      this.amr,
      this.appid,
      this.appidacr,
      this.email,
      this.familyName,
      this.givenName,
      this.idp,
      this.ipaddr,
      this.name,
      this.oid,
      this.rh,
      this.scp,
      this.sub,
      this.tid,
      this.uniqueName,
      this.uti,
      this.ver});

  BobUser.fromJson(Map<String, dynamic> json) {
    aud = json['aud'];
    iss = json['iss'];
    iat = json['iat'];
    nbf = json['nbf'];
    exp = json['exp'];
    acr = json['acr'];
    aio = json['aio'];
    amr = json['amr'].cast<String>();
    appid = json['appid'];
    appidacr = json['appidacr'];
    email = json['email'];
    familyName = json['family_name'];
    givenName = json['given_name'];
    idp = json['idp'];
    ipaddr = json['ipaddr'];
    name = json['name'];
    oid = json['oid'];
    rh = json['rh'];
    scp = json['scp'];
    sub = json['sub'];
    tid = json['tid'];
    uniqueName = json['unique_name'];
    uti = json['uti'];
    ver = json['ver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aud'] = this.aud;
    data['iss'] = this.iss;
    data['iat'] = this.iat;
    data['nbf'] = this.nbf;
    data['exp'] = this.exp;
    data['acr'] = this.acr;
    data['aio'] = this.aio;
    data['amr'] = this.amr;
    data['appid'] = this.appid;
    data['appidacr'] = this.appidacr;
    data['email'] = this.email;
    data['family_name'] = this.familyName;
    data['given_name'] = this.givenName;
    data['idp'] = this.idp;
    data['ipaddr'] = this.ipaddr;
    data['name'] = this.name;
    data['oid'] = this.oid;
    data['rh'] = this.rh;
    data['scp'] = this.scp;
    data['sub'] = this.sub;
    data['tid'] = this.tid;
    data['unique_name'] = this.uniqueName;
    data['uti'] = this.uti;
    data['ver'] = this.ver;
    return data;
  }
}
