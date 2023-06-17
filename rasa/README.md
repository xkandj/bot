# environments
```shell
docker: 20.10.12
```

# RUN
a simple way:
```shell
chmod +x start_servers.sh
./start_servers.sh
```

# rasa_ep
```shell
docker exec rasa_ep rasa train  # train model
docker-compose restart rasa_ep  # load model
```

# action_ep
```shell
docker-compose restart action_ep  # run actions servers
```

# html
```shell
docker-compose restart html  # restart html http servers
bestyintao.com:5000  # visit website
```

# wx
```shell
docker-compose restart wx # restart weixin servers
```


