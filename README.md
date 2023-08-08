
## **DZ  Virtualization  - 4**


### ЗАДАЧА 1

![Мой образ centos](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/dz%20-%20image.PNG?raw=true)

### ЗАДАЧА 2

![Yandex Cloud GUI](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/dz%20-%203-2.PNG?raw=true)

![Yandex Cloud GUI](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/dz%20-%203-2.PNG?raw=true)


![Yandex Cloud GUI](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/dz%20-%203-3.PNG?raw=true)




![Terraform Apply](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/Terraform%20Apply%201.PNG?raw=true)

![Terraform Apply](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/Terraform%20Apply%202.PNG?raw=true)
![Terraform Apply](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/Terraform%20Apply%203.PNG?raw=true)
![Terraform Apply](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/Terraform%20Apply%205.PNG?raw=true)

### ЗАДАЧА 3


![docker ps](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/docker%20ps.PNG?raw=true)




### ЗАДАЧА 4  

![grafana web](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/dz%20-%204.PNG?raw=true)

### ЗАДАЧА 5
Бился, бился. так и не смог сделать задачу №5. не хочет работать никак.

Что сделал:
 - условно назвал worker вторую вм (мониторинг которой надо подключить к первой вм по заданию.) 
 - создал второй плейбук для настройки worker (идентичный provision.yml только для hosts worker)
 - создал второй docker-compose для настройки worker (идентичный первому, только из сервисов оставлены только nodeexporter, cadvisor и caddy (на всякий), потому что больше для наблюдаемой ноды поднимать не надо ничего)
 - соответственно указал в конце worker плейбука  в  команде docker-compose -f  ссылку на второй docker-compose файл для worker. 
 - расширил конфиг в prometheus дополнительным ip:port (worker вм)
 - после того как ничего не получилось, попытался создать таски для создания отдельно nodeexporter и cadvisor  с параметром provisioned_ports. Ругается на версию библиотеки python (хотя создавал перед этим спец таску в provision для worker по установке epel-release  python3 python3-pip ) . Python2  - та же самая ошибка. интерпретатор пайтона в файле inventory тоже результатов не дал. не понимаю тотально, какая всё-таки библиотека нужна и как её указать. 


таким образом, вывод docker ps на задаче 4  после запуска второй вм равнялся выводу докера, ни одного контейнера не видно.
Публикую Скрины: 


![error](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/error%20host.PNG?raw=true)
'error host.PNG' 
- вывод ошибки при попытке поднятия 2 compose файлов с режимом сети host


![scrape](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/scrape_config.PNG?raw=true)

- снимок scrape config для job нодэкспортера и cadvisor (в файле prometheus.yml)

![python](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/python-error.PNG?raw=true)

 - 'python error.PNG'  - ошибка библиотеки python при попытке запустить ролью \ таской в yml  nodeexporter и cadvisor.

Контейнеры для второй вм не стартуют и не отображаются при docker ps (хотя я их даже назвал в compose для worker по другому).
Очень много сжёг облака, пока тестировал обе вм, потому что никак не могу настроить worker локальные вм попрактиковаться через hyper-v. Просто кошмар. очень расстраивает потеря времени впустую