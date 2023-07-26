Виртуализация  - 1 Д.З.

Задача 1

Паравиртуализация:
Способ создания виртуализации разных (гостевых) ОС под контролем гипервизора, запускаемый при помощи хостовой (домашней) ОС. Гипервизору необходима хостовая ОС для доступа к аппаратным ресурсам физ. хоста.
Незначительно модифицирует ядро гостевой ОС (запускаемой)  для разделения доступа к ресурсам физ. хоста, безопасности. 
Гостевым ОС приоритет от 1 и выше. Гостевые ОС не имеют доступа к ресурсам, как хостовая ОС. Их доступ к аппаратным ресурсам контролирует и выделяет гипервизор. У каждой гостевой ОС есть ядро, но оно модифицируется в сторону повышения изолирования и  производительности (в этом отличие от динамической трансляции).


Полная (аппаратная) виртуализация:
Способ создания виртуализации любых (гостевых) ОС под контролем гипервизора без хостовой  ОС. 
Ёё функции выполняет гипервизор с -1 приоритетом доступа к аппаратным ресурсам. 
приоритет 0 у гостевых ОС. 
У каждой ОС своё ядро, и его можно патчить. Каждая ОС изолирована друг от друга.
Каждая ОС содержит свои виртуальные устройства.Ядро каждой ОС не модифицируется для запуска (в отличие от паравиртуализации).

Виртуализация уровня ОС:

Способ создания виртуализации ОС Windows и Linux под контролем хостовой ОС, исполняющей функции гипервизора. Каждая гостевая ОС \ Виртуальная машина = контейнер = процесс. ресурсы ограничиваются в контейнерах. Ядра Гостевых ОС обязательно должны совпадать с ядром хостовой ОС. 
Контейнеры монтируют устройства гостевой ОС, но выглядят как ВМ. 
Полностью изолированы друг от друга, но все используют одно ядро хостовой ОС. (в отличие от аппаратной виртуализации).

 
Задача 2.

1. высоконагруженная база данных, чувствительная к отказу
Виртуализация уровня ОС

Возможность создавать отказоустойчивые кластеры (менее производительно, чем аппаратная виртуализация, но получше паравиртуализации). Возможность быстрого масштабирования и выделения  \ освобождения ресурсов и репликации в отличие от физ серверов.Выигрыш в аппаратных ресурсах  за счёт легковесности каждой ВМ - контейнера.


2. различные web-приложения;
Виртуализация уровня ОС

Безопасная изоляция ВМ с их приложениями от ядра хостовой ОС, и следовательно от всей  инфраструктуры в целом (целесообразно от угроз веб атак извне). Масштабируемость при повышенных нагрузках.
Преимущество быстрой миграции на другие платформы (независимость от вендора тк работает на Linux)

3. Windows-системы для использования бухгалтерским отделом;
Паравиртуализация 

Шаблонизированное создание ВМ, довольно стабильные, почти не изменяемые критерии по ресурсам. 
Большой выбор вариантов ОС. Удобство и скорость настраивания из коробки. 


4. системы, выполняющие высокопроизводительные расчёты на GPU.
Физические сервера

Наиболее высокая производительность в силу отсутствия виртуализации ОС в принципе. не требуется гипервизор и ОС. Жёсткие, не меняющиеся критерии по ресурсам ввиду конкретного назначения систем - вычислительная мощность. Дешевизна эксплуатации и поддержки.


Задача 3. 

1. Docker
Контейнеризация станет отличным выбором для построения автоматизации резервных копий. Быстрая репликация, отсутствие гипервизора и легковесность процессов - ВМ позволит быстро масштабировать ресурсы и распределять нагрузку. Виртуализация уровня ОС позволяет развёртывать и Windows и Linux машины

2. XEN
кроссплатформенность. для Windows режим PV , для Linux  - HVM 
отличная поддержка драйверов под Linux. Производительность засчёт стабильности (у каждой гостевой ОС свои неприкасаемые выделенные ресурсы)

3. Hyper-V
Полная совместимость с  Windows Server. Простота установки новых ролей сервера. Нет прерывания сервиса для обслуживания или обновления безопасности. Обширнейшая поддержка различных устройств. Бесплатен для Windows.

4. KVM
Нативность для большинства ядер Linux. Возможность установки дистрибутивов из заранее подготовленных шаблонов (под разные условия тестирования продукта). Гипервизор 1 типа (hardware based) - наиболее приближен к аппаратной части.Выигрыш у OpenVZ (к примеру) в более гибкой кастомизации, настройке под ситуацию, меньшим расходом ресурсов засчёт гипервизора и экономией времени, так как предустановлен в Linux.


Задача 4.

Проблемы гетерогенной среды:

Трудоёмкая совместимость разных (особенно проприетарных) решений виртуализации и других программных продуктов ;
Сложная система отказоустойчивости - разные решения имеют свои алгоритмы для разных ситуаций, а общие аппаратные ресурсы конечны.
Совместимость  комбинаций разных аппаратных и программных продуктов;
Сложность абстракций с учётом работы разных решений в разных инфраструктурах (облака разных вендоров);
Высокий порог входа для поддержки (команда инженеров);
Трудоёмкая поддержка версионирования и лицензирования;
Громоздкая политика Безопасности по каждому решению и в целом проекта;


Решение:
Максимальная унификация выбора продуктов виртуализации  - каждому решению своя конкретная обоснованная задача
Взвешивание и оценка рисков производительности и поддержки - там, где можно, отказаться от проприетарных решений в пользу опенсорса ввиду отсутствия необходимости лицензирования последнего
Взвешивание и оценка угроз безопасности, создание бесшовной архитектуры проекта таким образом, чтобы были точки контроля над виртуализацией и перехода данных из одной абстракции в другую при разных сценариях работы.
Создание кластеров отказоустойчивости внутри которых будет максимально "дружелюбные" друг к другу  продукты (с целью простоты настройки).
 

Мой выбор:  
 Мой личный выбор в пользу экономии средств и унификации. То есть скорее в сторону не гетерогенной среды. Но так как скупой платит дважды, самый же главный упор в планировании я бы сделал на анализ всей архитектуры проекта и чёткого распределения задач каждого решения под каждую нужду бизнеса. Нужно понять, где нам не обойтись без гетерогенной среды (даже в случае преобладания опенсорсных и, казалось бы, более гибких решений), а где можно и нужно от неё отказаться.

Пример №1
Сервис облачного гейминга
PaaS
Нужна комбинация гетерогенности и унификации.
Виртуализация здесь обусловлена в первую очередь производительностью. 
Гетерогенность нужна: В пользовательских окружениях (выбор любой ОС с максимально возможноыми требованиями по ресурсам на выбор, выбор любого типа подключения, обширный выбор географии подключения - распределение и балансировка нагрузки между разными регионами \ зонами доступности), в окружениях разработки ( обширный стек технологий, обеспечивающие в первую очередь бесперебойность доставки огромного количества трафика  - смесь проприетарных и опенсорсных решений, поддержка самих сред разработки, текстирования, продакшна).
Гетерогенность не нужна: в администрировании (унификация подразумевает относительно низкий порог входа  для инженеров, ведение процессов, базы знаний согласно политикам компании, инструменты L1 / L2 поддержки ), в безопасности (подойдёт какое-нибудь единое проприетарное решение, которому можно доверить облачные фаерволы, аудиты безопасности, отслеживание и патч уязвимостей и т.д.)


Пример №2
Государственный Банк
On demand 
Гетерогенность не нужна.
Виртуализация обусловлена безопасностью.
Крайне узкий выбор стандартизированных инструментов, отвечающим требованиям законодательства и сертификации. Крайне жёсткое лицензирование и версионирование продуктов. Высочайшие требования шифрования, резервного копирования, многоуровневой авторизации.
Многослойная аутентификация с минимумом данных. DevSecOps. В идеале - Единое монолитное решение по подписке либо самописная система из открытого голого дистрибутива. Росплатформа, ROSA, Astra Linux Брест.



Пример №3:
Организация работы сети удалённых офисов международной трансконтинентальной корпорации
IaaS
В данном случае выбор средств виртуализации обоснован преимущественно стабильностью соединения, безопасностью данных, множеством команд инженеров поддержки и кроссплатформенностью для гостевых ОС.
Необходима Гетерогенная среда
Гетерогенность потребуется в персональных пользовательских окружениях (много абсолютно шаблонов ОС, в том числе разных дистрибутивов и ядер разных ОС  на выбор), в окружениях поддержки разных внутренних структур организации: а) для отдела бухгалтерии пул из 500 производительных машин, довольно определённых, стабильных требований к ресурсам (каждой ВМ) - со своей технологией виртуализации - акцент на отказоустойчивость - XEN), б) для отдела финансов либо юридического отдела  пул из 100 безопасных машин предполагающие в первую очередь безопасность, репликацию и шифрование данных в закрытом извне кластере со своими технологиями виртуализации - акцент на изолирование ресурсов ВМ, шифрование трафика, аудитирование безопасности всего входящего и выходящего трафика, строжайшее  разграничение доступов  и т. д. - VMWARE ESXI в) для отдела разработки сайтов, приложений, внутренних ресурсов интранета -  пул из  быстро масштабируемых 300 машин. динамичное оркестрирование ресурсами, возможность оперативного масштабирования, широкая совместимость с самыми разнообразными ядрами linux с целью создания сред тестирования любых нагрузок - OpenVZ




