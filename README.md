## **DZ Terraform - 1**

## Задача 1

### ЗАДАЧА 1.1.

![terraform  1 output](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/terraform-1-1.PNG?raw=true)

### ЗАДАЧА 1.2.

в файле personal.auto.tfvars допустимо

### ЗАДАЧА 1.3.

`"result":  "a3Pf2uno81SPUkf3"`

![terraform 2 output](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/terraform-1-3.PNG?raw=true)

### ЗАДАЧА 1.4.

- Error: Missing name for resource
  пропущено имя ресурса образа "nginx"

- Error: Invalid resource name
  ошибка в имени ресурса - некорректное название ресурса контейнера с цифры

* Reference to undeclared resource - опечатка (FAKE) при создании контейнера. исправлено на:

  <code> name = "example\_${random_password.random_string.result}" </code>

### ЗАДАЧА 1.5.

![docker ps](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/terraform-dockerps-%201-5.PNG?raw=true)
![fixed code](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/terraform-1-5-code_fixed.PNG?raw=true)

### ЗАДАЧА 1.6.

`terraform apply --auto-approve` избавляет нас от необходимости набирать yes для применения terraform plan + terraform apply. после команды пересоздался контейнер из-за того, что мы поменяли ему имя в атрибуте name. Опасность ключа --auto-approve в том, что изменения применяются автоматически, пропускается стадия их одобрения человеком. и контейнеры в среде "production" просто рестартанут, добавив задержки доступности и убытков бизнесу просто из-за лишнего символа в изменённом .tf файле в атрибуте name (с применённом ключом `apply --auto-approve`)

![docker ps](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/terraform-dockerps-%201-6.PNG?raw=true)

### ЗАДАЧА 1.7.

![terraform_state](https://github.com/vasi4-dev/devops-netology/blob/main/snips_dz/terraform-state-1-7.PNG?raw=true)

### ЗАДАЧА 1.8.

> keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

При выставлении атрибута `keep_locally ` со значением `true` при удалении ресурса / даты terraform не тронет образ docker'a, скачанный им локально на хост из его хранилища (т.е. удалит только свой объект). Он выставлен в блоке кода в .tf, описывающий ресурc image - соотв. сам образ не был удалён локально.

## Задача 2

не удалось сделать, так как бесконечное "создание" вм провайдером.
Still creating.... до истечения таймаута. Это при "eth0" host_interface. При любых других пишет, что ошибка в имени host_INTERface, в документации о нём нет ничего.  
Попытаюсь сделать с провайдером terra-farm....
