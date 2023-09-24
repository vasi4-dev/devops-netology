## **DZ Terraform - 2**

## Задача 1

![скриншот ВМ с Яндекса GUI](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf-VM1.PNG?raw=true)
![скриншот ВМ с Яндекса 2](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf-VM1-1.PNG?raw=true)

![скриншот ssh подключения](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf_ssh_connection.PNG?raw=true)

Опечатка была в id платформы platform_id : правильно <code>
"standard-v1" </code>

<code>preemptible = true</code>
прерываемая ВМ. То есть, выключаемая по расписанию ВМ. Вроде как 24 часа по умолчанию. Ввиду этого - нестабильная с точки зрения доступности под рабочую нагрузку, стоит меньше денег по тарифу облака - экономия.

<p>

<code>core_fraction=5</code>
мощность ядер ЦП в ВМ в процентах. 5 процентов - минимально возможный. Ввиду этого - соответственно самая низкая выч. мощность - стоит меньше денег - по тарифу облака - экономия.

## Задача 2

Без изменений:
![No changes - terraform](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf_no_changes_1.PNG?raw=true)

## Задача 3

Вторая ВМ:
![second vm](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf-vm2.PNG?raw=true)
![second vm2 ](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf-vm2-2.PNG?raw=true)

## Задача 4

![output](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf-output.PNG?raw=true)

## Задача 5

Скриншот кода:
![local](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf-locals.PNG?raw=true)

## Задача 6

Без изменений:
![No changes - terraform 2 ](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf_no_changes_2.PNG?raw=true)

## Задача 7

- <code>local.test_list.1</code>
- <code>length(local.servers.stage.disks)</code>
- <code>local.test_map.admin</code>
- <code>"John is admin for production server based on OS ${local.servers.stage.image} with ${local.servers.stage.cpu} cpu, ${local.servers.stage.ram} ram and ${length(local.servers.stage.disks)} virtual disks"</code>

![вывод](https://github.com/vasi4-dev/devops-netology/blob/terraform-02/terraform-02/dz_screenshots/tf-console.PNG?raw=true)
