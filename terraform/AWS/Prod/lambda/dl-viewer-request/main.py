import boto3

s3 = boto3.client("s3")

response = s3.list_objects(
    Bucket="repo.vineelsai.com",
)


def lambda_handler(event: dict, context: dict):
    request = dict(event["Records"][0]["cf"]["request"])
    uri = str(request.get("uri"))

    dir_list = []

    uri = uri.lstrip("/")

    for content in response.get("Contents", []):
        key = str(content["Key"])
        if uri == key:
            print("Found")
            break
        elif key.startswith(uri):
            uri_split = (
                uri.split("/") if "" not in uri.split("/") else uri.split("/")[1:]
            )
            key_split = key.split("/")

            if len(uri_split) + 1 == len(key_split) and key_split[-1] == "index.html":
                dir_list = []
                uri = uri + "/index.html"
                break
            elif len(uri_split) + 1 == len(key_split):
                dir_list.append(key_split[len(key_split) - 1])
            elif len(uri_split) + 1 < len(key_split):
                dir_list.append(key_split[len(uri_split)])

    dir_list = list(set(dir_list))
    if len(dir_list) > 0:
        return {
            "status": "200",
            "statusDescription": "Found",
            "headers": {
                "cache-control": [
                    {
                        "key": "Cache-Control",
                        "value": "max-age=3600",
                    },
                ],
                "content-type": [
                    {
                        "key": "Content-Type",
                        "value": "text/html",
                    },
                ],
            },
            "body": "\n".join(
                [
                    f'<a href="https://repo.vineelsai.com/{uri + "/" if uri != "" else "" }{dir}">{dir}</a><br>'
                    for dir in dir_list
                ]
            ),
        }

    request["uri"] = "/" + uri

    return request
