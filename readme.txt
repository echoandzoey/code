执行示例：
运行服务器
./skynet /mnt/c/imdt_2021/server/lesson_01/config


运行客户端
3rd/lua/lua /mnt/c/imdt_2021/server/lesson_01/client.lua


报错 No such file or directory：路径错误，首先看config.path中的路径是否改成自己的（3处），再看wsl中输入的路径是否正确
报错 listen error：大概率是端口已被占用，使用 Ctrl+C 退出，然后使用 pgrep skynet | xargs kill 或者 pgrep skynet 关闭端口
