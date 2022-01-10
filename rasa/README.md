# environments
```shell
docker: 20.10.12
```

# 启动所有服务
```shell
chmod +x first_time_start.sh
./first_time_start.sh
or Run directly:
docker-compose up -d
```

# rasa_ep
```shell
docker exec rasa_ep rasa train  # 修改rasa配置或数据执行生成模型
docker-compose restart rasa_ep  # 重新加载模型
```

# action_ep
```shell
docker-compose restart action_ep  # 修改了action代码后需要重启服务生效
```

# html
```shell
docker-compose restart html  # 重启网页服务
bestyintao.com:5000  # 访问网页
```

# wx
```shell
docker-compose restart html  # 重启网页服务
bestyintao.com:5000  # 访问网页
```


