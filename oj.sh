#!/bin/bash
echo "########################################################"
echo "#                                                      #"
echo "#                                                      #"
echo "#                                                      #"
echo "#                    OJ Management                     #" 
echo "#                                                      #"
echo "#                   by:养正稳健IT社                     #"
echo "#                 translated by ph1366                 #"
echo "#                                                      #"
echo "########################################################"
echo ""
echo ""
echo "1. Bat dau"
echo "2. Kiem tra trang thai"
echo "3. Cap nhat"
echo "4. Backup"
echo "5. Nhap du lieu"
echo "6. Khoi dong lai"
echo "7. Dung (stop) server"
echo ""
echo "Nhan Ctrl-C de thoat khoi script"
echo ""
read -p "Vui long nhap code:" num
if [ "$num" == "1" ]
    then
    docker-compose up -d
    read -s -p "Nhan enter de tiep tuc..." continue
    reset
    ./oj.sh
elif [ "$num" == "2" ]
    then
    docker ps -a
    read -s -p "Nhan enter de tiep tuc..." continue
    reset
    ./oj.sh
elif [ "$num" == "3" ]
    then
    git pull
    docker-compose pull && docker-compose up -d
    read -s -p "Nhan enter de tiep tuc..." continue
    reset
    ./oj.sh
elif [ "$num" == "4" ]
    then
    cp -r data data_bak
    read -s -p "Sao luu thanh cong, nhan enter de tiep tuc..." continue
    reset
    ./oj.sh
elif [ "$num" == "5" ]
    then
    echo "Chac chan rang ngan hang cau hoi duoc nhap trong thu muc OnlineJudgeDeploy/data/backend/test_case"
    read -s -p "Nhan enter de tiep tuc..." continue
    docker cp old_data.json oj-backend:/app/utils/
    docker exec -it oj-backend /bin/sh
    cd ./utils
    python3 migrate_data.py old_data.json
    read -s -p "Nhan enter de tiep tuc..." continue
    reset
    ./oj.sh
elif [ "$num" == "6" ]
    then
    docker-compose restart
    read -s -p "Nhan enter de tiep tuc..." continue
    reset
    ./oj.sh
elif [ "$num" == "7" ]
    then
    docker-compose stop
    read -s -p "Nhan enter de tiep tuc..." continue
    reset
    ./oj.sh
fi
