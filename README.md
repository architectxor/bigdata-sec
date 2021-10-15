# Отчет по практической работе №4 "Работа с Docker и Docker Compose"

Сначала необходимо установить Docker, и запустить его командами:
```sh
# systemctl enable docker.service
# systemctl start docker.service
```

После того, как Docker запущен, создадим директорию для Web-приложения и перейдем в нее
В ней разместим два файла `app.py` и `storage.py`, их содержимое показано на рисунках 2 и 3 соответственно.

![image](https://user-images.githubusercontent.com/49113443/136563732-7ae959ee-b71f-4517-b7fa-77d8e84cced9.png)

Рисунок 1 - Содержимое файла app.py


![image](https://user-images.githubusercontent.com/49113443/136563841-f16e9443-85a9-4c1f-89d3-5eae2abd6e25.png)

Рисунок 2 - Содержимое файла storage.py

Для работы этого приложения используется база данных MongoDB её образ пристутствует в DockerHub'e.

Поммимо этого добавим прсото TODO приложение, на Node JS, из Getting Started манула с сайта докера.
Итоговая структура файлов необходимых нам для создания контейнеров средствами docker-compose представлена на рисунке 3.

![1-project-tree](https://user-images.githubusercontent.com/49113443/137535839-bd0e4d3a-a12a-428b-a03a-c6ce1ef5c927.png)

Рисунок 3 - Структура проекта


В директории `web-app/` необходимо создать `Dockerfile` с содержимым представленным на рисунке 4.

![2-uuid-dockerfile](https://user-images.githubusercontent.com/49113443/137536012-98e6bdbb-e9bc-4bae-88c9-5ee1d6db2e60.png)


Рисунок 4 - Dockerfile для приложения, использующего MongoDB


Теперь в корневой директории проекта создадим файл `docker-compose.yml` необходимый для работы docker-compose с содержимым представленным на рисунке 5.

![3-docker-compose](https://user-images.githubusercontent.com/49113443/137536229-6ecf28c8-dca9-45c7-bce8-653a0e9d5431.png)


Рисунок 5 - Конфигурационный файл docker-compose

Теперь можно запустить docker-compose и убедиться, что все контейнеры функционируют как покзаано на рисунке 6.

![4-docker-compose-up-n-ps](https://user-images.githubusercontent.com/49113443/137536367-bdb7aa92-51d4-44af-9cf2-8e069fab14e3.png)

Рисунок 6 - Запуск контейнеров и отображения их в списке

Теперь добавим несколько пунктов в TODO-приложение, как показано на рисунке 7. А также убедимся, что приложение использующее MongoDB, действительно отработало корректно, результат представлен на рисунке 8.
![5-todo-app](https://user-images.githubusercontent.com/49113443/137536576-e2ab9591-c261-428e-9682-14162d84241a.png)


Рисунок 7 - Добавление пунктов в список TODO-приложения


![6-uuid-app-logs](https://user-images.githubusercontent.com/49113443/137536644-32c2243d-caef-43ce-8233-3b9e5797c69f.png)


Рисунок 8 - Проверка работы приложения, взаимодействующего с MongoDB


Теперь перезапустим сервисы, как показано на рисунке 9, и убедимся, что пункты добавленные в список были действительно сохранены в базу данных MySQL, как показано на рисунке 10.
![8-explore-db](https://user-images.githubusercontent.com/49113443/137537031-289099f0-bb84-4bf9-81e4-5ed413137fa6.png)

Рисунок 10 - Просмотр содержимого базы данных MySQL, сохраненного в Docker volume


**Вывод**: В данной работе мы развернули несколько контейнеров и настроили взаимодействие между ними, при помощи написания `Dockerfile`'ов
и надстройки над Docker для более удобного запуска нескольких контейнеров Docker Compose.


