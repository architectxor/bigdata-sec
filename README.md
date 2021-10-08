# Отчет по практической работе №2 "Настройка СУБД MySQL и работа с базами данных"

В данной лабораторной работе необходимо выполнить следующее:
1) Поместить выбранные при создании имя пользователя и пароль в файл «.my.cnf», расположенный в домашней директории;
2) Создать базу данных «example» и разместить в ней таблицу «users», состоящую из двух столбцов: числового «id», и строкового «name»;
3) Таблицу необходимо заполнить произвольными значениями, сделать дамп данной базы данных и развернуть содержимое в новой базе данных под названием «sample»;
4) Дополнительно необходимо сделать дамп таблицы «help_keyword» из базы данных «mysql», таким образом, чтобы она содержала лишь первые 100 записей.

На данной виртуальной машине, уже был создан пользователь с паролем «master», добавление этой информации представлено на рисунке 1. Пара логин/пароль записывается для каждой утилиты в отедельную запись.

![image](https://user-images.githubusercontent.com/49113443/136514335-8b3744e3-005b-4e10-a723-db9984327678.png)

Рисунок 1 — Добавление информации о пользователе в конфигурационный файл

После того как изменения записаны в конфигурационный файл, переходим к созданию базы данных «examples», как показано на рисунке 2. Сначала проверим, что база данных с таким названием отсутствует в списке баз данных, создадим ее, и для создания таблицы внутри этой базы данных сначала укажем какую базу данных необходимо использовать.
Для поля id укажем атрибуты UNSIGNED, NOT NULL и AUTO_INCREMENT, тем самым расширим диапазон значений этого поля, запретим ему оставаться неопределенным и укажем, что значение этого поля должно увеличиваться на единицу автоматически при добавлении нового картежа в отношение.
Также укажем, что столбец id будет использован в качестве первичного ключа.

![image](https://user-images.githubusercontent.com/49113443/136514374-270bf2c8-2b01-45b3-a39f-769095256cbf.png)

Рисунок 2 — Создание базы данных examples

После того, как база данных создана и заполнена произвольными значениями при помощи сервиса filldb.info можно выполнить бэкап базы данных в файл как показано на рисунке 3.
![image](https://user-images.githubusercontent.com/49113443/136514407-2474eb1a-ba3e-4116-a6ea-5cf380b3d912.png)

Рисунок 3 — Экспорт базы данных в файл

Для того, чтобы импортировать базу данных из файла, необходимо сначала создать новую базу, куда будет импортирована база данных из файла, а затем при помощи конвеера передать файл бэкапа программе mysql. Данная процедура показана на рисунке 4.

![image](https://user-images.githubusercontent.com/49113443/136514460-8e45560f-ef51-41a0-8822-634a7bc727d8.png)

Рисунок 4 — Развертывание базы данных из бэкапа

Осуществим проверку того, что база действительно импортирована, выведя все записи таблицы «users» как показано на рисунке 5.

![image](https://user-images.githubusercontent.com/49113443/136514498-6b877eb5-020a-4c00-af4f-32ced86cc7bb.png)

Рисунок 5 — Проверка базы данных после того, как она была импортирована

Следующей задачей является экспорт первых 100 записей таблицы «help_keyword» в файл. На рисунке 6 можно видеть, что для этого у утилиты sqldump есть опция «--where», которая позволяет отфильтровать то, какие записи будут записаны в файл.

![image](https://user-images.githubusercontent.com/49113443/136514561-5be3db40-fa82-452b-aad4-9c94d30a6513.png)

Рисунок 6 — Экспорт первых 100 строк таблицы «help_keyword»

Проверить, что экспортированы были действительно первые 100 строк таблицы можно открыв файл, который был указан при вызове утилиты sqldump c помощью текстового редактора, как показано на рисунке 7.

![image](https://user-images.githubusercontent.com/49113443/136514595-745e2c58-6755-4c55-b96a-015d0e09d433.png)

Рисунок 7 — Содержимое файла, куда была экспортирована таблица «help_keyword»

Дальше, согласно заданию необходимо создать таблицы пользователи, группы, сообщения, комментарии, активность, а также таблицы, которые позволят использовать лайки для медиафайлов, постов и пользователей.
Таблицы будут иметь структуру представленную на рисунке 8.
Заполним таблицы с помощью сервиса filldb.info, содержимое таблиц представлена на рисунках с 9 по 15, для удобства представления было выведено всего 10 строк из 100 для каждой таблицы.

![image](https://user-images.githubusercontent.com/49113443/136514640-239e85e1-bf5e-4b63-bb62-1b5825080790.png)

Рисунок 8 — Структура таблиц

![image](https://user-images.githubusercontent.com/49113443/136514680-f6ccd078-94f1-4520-ad11-cf4bee72a15b.png)

Рисунок 9 — Первые 10 строк таблицы activity

![image](https://user-images.githubusercontent.com/49113443/136514719-3cb496bf-cbe1-4444-a4e3-aa6c6a9444b2.png)

Рисунок 10 — Первые 10 строк таблицы comments

![image](https://user-images.githubusercontent.com/49113443/136514760-c6fda9e1-19e6-4f2b-9216-33ebdc4a44f1.png)

Рисунок 11 — Первые 10 строк таблицы groups

![image](https://user-images.githubusercontent.com/49113443/136514789-3217b4e5-00bc-41e8-84a5-ecda79799346.png)

Рисунок 12 — Первые 10 строк таблицы likes

![image](https://user-images.githubusercontent.com/49113443/136514812-a1bfc479-4925-4361-af6e-88913f337ce6.png)

Рисунок 13 —  Первые 10 строк таблицы media

![image](https://user-images.githubusercontent.com/49113443/136514834-f9b745b3-14e2-423b-9027-6e8c63a6bbc7.png)

Рисунок 14 —  Первые 10 строк таблицы posts

![image](https://user-images.githubusercontent.com/49113443/136514867-5ef8bf3c-eb98-448f-b1b9-bae4ab73860d.png)

Рисунок 15 — Первые 10 строк таблицы users

**Вывод:** В данной работе была создана база данных и заполнена произвольными значениями, затем было произведено ее копирование в файл, а затем развертывание в другой базе данных. Также при помощи утилиты sqldump было отфильтровано содержимое таблицы перед ее непосредственным резервным копированием в файл. В завершение была создана упрощенная структура базы данных vk, которая также была заполнена произвольными значениями.
