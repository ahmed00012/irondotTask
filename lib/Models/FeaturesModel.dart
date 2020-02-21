class Features {
  String key;
  String value;

  Features.fromApi(data) {
    this.key = data['key'];
    this.value = data['value'];
  }
}
