class Appliances {
  int? _id;
  String? _mApplianceName;
  String? _mApplianceWattage;
  String? _mApplianceQuantity;
  String? _bettryType;
  String? _InverterType;
  String? _PlatesType;

  Appliances.empty();

  Appliances(
      this._mApplianceName,
      this._mApplianceWattage,
      this._mApplianceQuantity,
      this._bettryType,
      this._InverterType,
      this._PlatesType,
      this._id);


  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  String? get mApplianceName => _mApplianceName;

  set mApplianceName(String? value) {
    _mApplianceName = value;
  } // Convert a Apppliance  object into a Map object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();


    map['id'] = _id;
    map['mApplianceName'] = _mApplianceName;
    map['mApplianceWattage'] = _mApplianceWattage;
    map['mApplianceQuantity'] = _mApplianceQuantity;
    map['bettryType'] = _bettryType;
    map['InverterType'] = _InverterType;
    map['PlatesType'] = _PlatesType;

    return map;
  }

  // Extract a Appliances object from a Map object
  Appliances.MapToObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._mApplianceName = map['mApplianceName'];
    this._mApplianceWattage = map['mApplianceWattage'];
    this._mApplianceQuantity = map['mApplianceQuantity'].toString();
    this._bettryType = map['bettryType'];
    this._InverterType = map['InverterType'];
    this._PlatesType = map['PlatesType'];
  }

  String? get mApplianceWattage => _mApplianceWattage;

  set mApplianceWattage(String? value) {
    _mApplianceWattage = value;
  }

  String? get mApplianceQuantity => _mApplianceQuantity;

  set mApplianceQuantity(String? value) {
    _mApplianceQuantity = value;
  }

  String? get bettryType => _bettryType;

  set bettryType(String? value) {
    _bettryType = value;
  }

  String? get InverterType => _InverterType;

  set InverterType(String? value) {
    _InverterType = value;
  }

  String? get PlatesType => _PlatesType;

  set PlatesType(String? value) {
    _PlatesType = value;
  }
}
