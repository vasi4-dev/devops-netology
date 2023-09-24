## **DZ Terraform - 2**

## Задача 1

![скриншот ВМ с Яндекса GUI]()
![скриншот ВМ с Яндекса 2]()

![скриншот ssh подключения]()

Опечатка была в id платформы platform_id : правильно <code>
"standard-v1" </code>

<code>preemptible = true</code>
прерываемая ВМ. То есть, выключаемая по расписанию ВМ. Вроде как 24 часа по умолчанию. Ввиду этого - нестабильная с точки зрения доступности под рабочую нагрузку, стоит меньше денег по тарифу облака - экономия.

<p>

<code>core_fraction=5</code>
мощность ядер ЦП в ВМ в процентах. 5 процентов - минимально возможный. Ввиду этого - соответственно самая низкая выч. мощность - стоит меньше денег - по тарифу облака - экономия.

## Задача 2

Без изменений:
![No changes - terraform]()

## Задача 3

Вторая ВМ:
![second vm]()
![second vm2 ]()

## Задача 4

![output]()

## Задача 5

Скриншот кода:
![local]()

## Задача 6

Без изменений:
![No changes - terraform 2 ]()

## Задача 7

- <code>local.test_list.1</code>
- <code>3</code>
- <code>local.test_map.admin</code>
- <code>John is admin for production server based on OS ${local.servers.stage.image} with ${local.servers.stage.cpu} cpu, ${local.servers.stage.ram} ram and ${length(local.servers.stage.disks)} virtual disks></code>
