<img src="https://lh3.googleusercontent.com/JsGtt7BHEbHhQl5OzJikROL49WGoN0fBNcU_mvLRjWqx7nm7r7rzdG0DpET4qcK1FhNkFpcKf600G-Eoxx-_q3D4iA=s120" height="64px"/>

<img src="https://1000logos.net/wp-content/uploads/2020/08/Nginx-Logo.png" height="64px"/>

<img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpic1.zhimg.com%2Fv2-7274d4af687f7812cb4c09ef147242db_720w.jpg%3Fsource%3D172ae18b&f=1&nofb=1&ipt=d7e1e1ab7d445fb1cc888f914142808d055f6ff282dce3b87e6733cc20eca6e6&ipo=images" height="64px"/>

<img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flogowik.com%2Fcontent%2Fuploads%2Fimages%2Fvector-by-datadog8674.jpg&f=1&nofb=1&ipt=d8fcaef7abcab58bdf965833c415455457f0a76b1755602389b3bf25af22e21a&ipo=images" height="64px" />

- [Ansible-Playbook установка](#Ansible-Install)
- [Clickhouse Params](#Clickhouse-Params)
- [Vector Params](#Vector-Params)
- [Nginx / Lighthouse Params](#nginx-Params)
- [Source](#getting-help)
- [Security](#security)
- [License](#license)
- [Copyright](#copyright)
- [Links](#links)

## Ansible-Playbook установка

Установка Кликхауса, Вектора, Nginx + Lighthouse по плейбуку.
Сначала проигрываются плей и его таски для хостов с lighthouse, так как web отображение должно уже функционировать на момент получения первых логов из приложения. Предполагается, что вектор, перенаправляет собираемые им из sources логи в БД Кликхаус, откуда их можно будет посмотреть в Лайтхаусе при помощи nginx.

Структура плейбука (директория Ansible):

`/defaults/main.yml` - все переменные для всех трёх групп хостов
<br>
`/group_vars/***/` - директория с переменными для каждой из групп (\*\*\*) хостов
<br>`/inventory/prod.yml` - файл с описанием самих хостов
<br> `/templates/***` - директория с шаблонами файлов конфигураций для vector и nginx
<br>
`/README.md` - этот файл описания репозитория
<br>
`/requirements.yml` - файл описания ролей, используемых в плеях

### сис.требования

- **внешний Internet**
- **Ansible 2.9+**
- **3 запущенные ВМ с ubuntu / centos ОС с предустановленным python3**
- **ssh доступ к хостам**

### Преднастройка

Необходимо скачать необходимые роли, перечисленные в requirements:

      ansible-galaxy install roles -r requirements.yml

### Note

не забудьте проверить имя пользователя и операционную систему на настраиваемых машинах!

Также необходимо внести ip машин и имена пользователей в файл `inventory/prod.yml` в ansible_host и ansible_user соответственно.

3 группы хостов: <br>
`clickhouse` - хосты с clickhouse <br>
`vector` - хосты с vector <br>
`lighthouse` - хосты с nginx + lighthouse

### Установка

    #  Убедитесь в SSH соединении с хостами
    ansible all -i inventory/prod.yml -m ping
    #  Введите команду:
    ansible-playbook -i inventory/prod.yml main.yml

Проверьте выставленные параметры в каждой из ролей. (пояснения по каждой в местных файлах README.md)
<br>
убедитесь в корректности версий продуктов в `defaults/main.yml` <br>
убедитесь в корректности tcp и http портов clickhouse в `/playbook/roles/clickhouse/defaults/main.yml` <br>
убедитесь в корректности переменных для групп хостов `/group_vars`:

- конфиг для clickhouse: `/clickhouse/clickhouse.yml` (проверьте корректность ip и креденшелов от БД)
- переменные для лайтхауса: `/lighthouse/vars.yml`
- конфиг для вектора: `/vector/vector.yml` (проверьте корректность заполнения директории логов, ip clickhouse и порт, креденшелы БД)
- переменные для лайтхауса: `/lighthouse/vars.yml`
- шаблоны конфигураций в каждой из ролей

## Getting Help

Clickhouse:
Если нашли баг в работе Кликхауса - то посетите [project website](https://clickhouse.com/).

Vector:
Если нашли баг в работе Вектора - то посетите [project website](https://vector.dev/).

Nginx:
Если нашли баг в работе Nginx - то посетите [project website](https://nginx.org/en/).

Lighthouse:
Если нашли баг в работе Lighthouse - то посетите [project website](https://github.com/GoogleChrome/lighthouse).
Также [репозиторий Lighthouse](https://github.com/VKCOM/lighthouse.git) из этой сборки

## Security

Clickhouse:
<br>
При обнаружении уязвимостей в ПО Кликхауса посетите, пожалуйста [vulnerability reporting page](https://trust.clickhouse.com/). Просьба **не** создавать новый инцедент на Github.

Vector:
<br>
При обнаружении уязвимостей в ПО Вектора посетите, пожалуйста [vulnerability reporting page](https://github.com/vectordotdev/vector/blob/master/SECURITY.md#vulnerability-reporting). Просьба **не** создавать новый инцедент на Github.

## License

Лицензия Clickhouse: [Apache v2.0 License](https://github.com/opensearch-project/ansible-playbook/blob/main/LICENSE.txt).
Лицензия Nginx: [Nginx] (https://docs.nginx.com/nginx/open-source-components/)

Лицензия Google Lighthouse: [Apache v2.0 License](https://github.com/GoogleChrome/lighthouse/blob/main/LICENSE)

Vector распространяется по OpenSource.

## Copyright

[Авторское соглашение Кликхауса](https://clickhouse.com/legal/agreements/terms-of-service)

[Nginx Open Source Components](https://docs.nginx.com/nginx/open-source-components/)

[Google Lighthouse agreement](https://github.com/GoogleChrome/lighthouse/blob/main/LICENSE)
