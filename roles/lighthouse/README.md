# Ansible Role: Lighthouse

[Ссылка на Gitlab tag v1.2 - основной playbook](https://github.com/vasi4-dev/devops-netology/tree/ansible-04)

## Description

Роль устанавливает Nginx и Lighthouse на группу хостов, определённых в вашем inventory.

## Requirements

- **Ansible 2.9+**
- **инвентори с ВМ с ОС семейства ubuntu с предустановленным python3**
- **успешное подключение к хостам по ssh**

## Role Variables

Переменные для пользователей хранятся в [defaults/main.yml](defaults/main.yml) файле.
Переменные по умолчанию не предполагаемые к изменению хранятся в [vars/main.yml](vars/main.yml) файле.

Пользовательские переменные:
| Name | Default Value | Description |
| -------------------------- | ------------- | ------------------------------------------------------------------------ |
| `nginx_user_name` | "ubuntu" | имя пользователя вебсервером на целевой машине |
| `nginx_ready_delay` | "5" | задержка для проверки поднятия службы вебсервера |

По умолчанию переменные:
| Name | Default Value | Description |
| -------------------------- | ------------- | ------------------------------------------------------------------------ |
| `lighthouse_location_dir` | "/usr/share/nginx/html/lighthouse" | Директория для Лайтхауса нацелевой машине. |
| `lighthouse_vcs` | "https://github.com/VKCOM/lighthouse.git" | репозиторий с Лайтхаусом. проверяйте версию ПО |

## Dependencies

Роль не зависит ни от каких внешних ролей.
Необходимо указать пользовательские переменные, и роль можно подключать в работу вашего плейбука:

`requirements.yml:`

```yaml
---
- src: git@github.com:vasi4-dev/lighthouse-role.git
  scm: git
  version: "latest"
  name: lighthouse
```

## Nginx / Lighthouse Params

Конфигурация для nginx заливается из файла `/templates/nginx.conf.j2`

Конфигурация для Lighthouse заливается из файла `/templates/lighthouse.j2`

Директория Lighthouse по умолчанию:

```

/usr/share/nginx/html/lighthouse

```

чтобы изменить её + такие параметры как:

```

{{lighthouse_vcs}} ## ссылка на репозиторий lighthouse
{{nginx_user_name}}

## имя пользователяь nginx на машине с lighthouse

{{nginx_ready_delay}}: 5

## интервал старта nginx в секундах

```

скорректируйте файл переменных для хостов lighthouse: `/group_vars/lighthouse/vars.yml`

## Example

Пример конфигурации:

После установки репозитория необходимо залить конфиг:

```yaml
---

- name: Lighthouse Git Setup
  become: true
  ansible.builtin.apt:
  name: git
  state: present

- name: Lighthouse - Git Clone
  become: true
  ansible.builtin.git:
  repo: "{{ lighthouse_vcs}}"
  version: master
  dest: "{{ lighthouse_location_dir }}"
- name: Lighthouse - config
  become: true
  ansible.builtin.template:
  src: lighthouse.conf.j2
  dest: /etc/nginx/conf.d/default.conf
  mode: "0644"
  notify: Restart nginx

```

### Example Handlers

Запуск NGinx:

```

- name: Start nginx
  become: true
  ansible.builtin.command: nginx
  changed_when: false

```

Перезапуск Nginx:

```

- name: Restart nginx
  become: true
  ansible.builtin.service:
    name: nginx
    state: restarted
  changed_when: false
```

## Tags

Так как роль только устанавливает ПО, то почти везде есть тег install.
Все теги перечислены ниже:

| Tag     | Action                                        |
| ------- | --------------------------------------------- |
| install | таски по установке пакетов                    |
| always  | таски, выполняемые всегда                     |
| config  | таски, относящиеся к настройке учётных данных |

## Troubleshooting

Lighthouse:
Если нашли баг в работе Lighthouse - то посетите [project website](https://github.com/GoogleChrome/lighthouse).
Также [репозиторий Lighthouse](https://github.com/VKCOM/lighthouse.git) из э

## License

[Google Lighthouse agreement](https://github.com/GoogleChrome/lighthouse/blob/main/LICENSE)

Лицензия Nginx: [Nginx] (https://docs.nginx.com/nginx/open-source-components/)

Лицензия Google Lighthouse: [Apache v2.0 License](https://github.com/GoogleChrome/lighthouse/blob/main/LICENSE)
