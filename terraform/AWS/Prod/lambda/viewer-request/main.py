def lambda_handler(event: dict, context: dict):
    request = event["Records"][0]["cf"]["request"]
    uri = str(request.get("uri"))

    if uri.endswith("/"):
        uri = uri + "index.html"
    elif "." not in request:
        uri = uri + "/index.html"
    request["uri"] = uri

    return request
