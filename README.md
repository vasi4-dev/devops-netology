
### **DZ  Virtualization  - 2**


1.1. Опишите основные преимущества применения на практике IaaC-паттернов.

- ускорение выхода продукта (шаблонизация описания сред)
- Синхронизация сред , устранение дрейфа конфигураций
- Ускорение создания любых сред для любой разработки: для тестирования, масштабирования, продакшна
- Для бизнеса: Сокращение Time to Market -  время от формирования идеи до её внедрения в сервис
	

2.1. Какой из принципов IaaC является основополагающим?

Идемпотентность  - свойство или характеристика операции, при выполнении которой мы раз за разом получаем результат, одинаковый с результатом после первого выполнения.


2.2. Чем Ansible выгодно отличается от других систем управление конфигурациями?
 - более низкий порог входа
 - не требует установки агентов для работы на целевых хостах
 - декларативный метод писания конфигураций
 - быстрый старт по криптопротоколу ssh


2.3. Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?

Надёжнее push, потому что легче один раз сказать куче хостов их настройки, чем устанавливать на каждый хост спец механизм (например, агент), который будет запрашивать свои настройки у управляющего хоста в свою очередь (и ещё думать про нагрузку на сеть и флудинг трафиком).


3.1. (Virtualbox) <br>
`vs44@localhost:~> VBoxManage -version`  <br>
`7.0.10_SUSEr158379` <br>


3.2. (vagrant) <br>
`vs44@localhost:~/netology/vagrant/bento-ubuntu> vagrant --version`  <br>
`Vagrant 2.3.7` <br>

3.3. (Terraform) <br>
`vs44@localhost:~> terraform --version` <br>
`Terraform v1.5.4`
`on linux_amd64` 

3.4. (Ansible) <br>

`vs44@localhost:~> ansible --version` <br>
`ansible [core 2.15.2]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/vs44/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.11/site-packages/ansible
  ansible collection location = /home/vs44/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.11.4 (main, Jun 28 2023, 19:51:46) [GCC] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True`


<br>
Задача 4  <br>
Создание ВМ:

![создание ВМ](https://raw.githubusercontent.com/vasi4-dev/devops-netology/78f78b28476eef3fa9cdfa02136bdaaf3e9d0409/snips_dz/up.PNG)

Настройка ВМ:

![настройка](https://raw.githubusercontent.com/vasi4-dev/devops-netology/78f78b28476eef3fa9cdfa02136bdaaf3e9d0409/snips_dz/provision.PNG)

Проверка факта установки DockeR:

![проверка](https://raw.githubusercontent.com/vasi4-dev/devops-netology/78f78b28476eef3fa9cdfa02136bdaaf3e9d0409/snips_dz/docker.PNG)