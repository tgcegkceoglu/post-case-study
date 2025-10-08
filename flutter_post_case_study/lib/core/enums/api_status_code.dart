enum ApiStatusCode { 
  ok(200),        // İstek başarılı (HTTP 200)
  notFound(404);  // Kaynak bulunamadı (HTTP 404)
  final int code;
  const ApiStatusCode(this.code);
}