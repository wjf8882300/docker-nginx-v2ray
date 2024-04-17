## 运行服务

上传证书，路径如下:
```
/data/nginx/cert
    ├── oragin.key      # pem 格式证书链
    └── oragin.pem      # pem 格式私钥
```

运行服务
```bash
#!/usr/bin/env bash

# 域名
SITE_DOMAIN=www.sample.com

# v2ray 的 client id
V2RAY_TOKEN=00000000-0000-0000-0000-000000000000

docker run -d \
    --restart=always \
    --name docker-nginx-v2ray \
    -v /data/nginx/cert:/data/cert \
    -p 80:80 \
    -p 443:443 \
    -e SITE_DOMAIN=${SITE_DOMAIN} \
    -e V2RAY_TOKEN=${V2RAY_TOKEN} \
    wjf8882300/v2ray:5.15.1
```


