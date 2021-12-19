# Отчет по курсовой работе "Обучение модели с помощью методов классификации"

В данной работе мы будем использовать программный пакет Splunk Enterprise для обучения модели на основе набора данных.

Данный набор данных уже является размеченным, в нем имеется столбец "is_anomaly", который является бинарным признаком, сообщающий является ли та или иная строка в наборе данных аномалией или нет.

Для того, чтобы набор данных был доступен в качестве источника данных для Splunk'a и используемых в нем плагинов, его необходимо разместить по абсолютному пути
`/opt/splunk/etc/system/lookups/`, как показано на рисунке 1.

![move-ds-to-lookups-dir](https://user-images.githubusercontent.com/49113443/146674807-5033ebb4-0ca0-4c92-870b-39ed26cf01be.png)
Рисунок 1 - Копирование набора данных, для использования в Splunk.

Помимо этого, Splunk установленный по умолчанию не содержит функциональности, которая позволяла при помощи него производить машинное обучение.
Поэтому из репозитория плагинов, которые в Splunk'е называются Apps, мы установим плагин Splunk Machine Learning Toolkit и вспомогательный плагин - Python for Scientific Computing.

в том, что они установлены можно убедиться, перейдя в `"Apps->Manage apps."`, как покзаано на рисунке 2.


![image](https://user-images.githubusercontent.com/49113443/146674895-9d107b2e-126f-474d-97df-65030b8c0f54.png)
Рисунок 2 - Проверка установленных плагинов.



После того, как выполнена первоначальная настройка, необходимо перейте в окно приложения Splunk ML Toolkit, и указать желаемый набор данных, алгоритм классификации 
и его настройки как показано на рисунке 3.


![setup-for-model](https://user-images.githubusercontent.com/49113443/146674958-12a76a24-e380-4ddb-96ae-5200518c1401.png)
Рисунок 3 - Форма для настройки модели машинного обучения.

После этого по нажатию на кнопку Fit, будет создана модель машинного обучения, которая затем будет применена к выбранному набору данных, в результате мы получим новый набор данных, в котором будет новый столбец с предсказанным значением указанной величины, как показано на рисунке 4 для метода классификации Random Forest.

![matrix](https://user-images.githubusercontent.com/49113443/146676465-a450cb6d-936e-40a9-8a06-beda704ffa9e.png)
Рисунок 4 - Результат работы модели и Confusion Matrix для метода Random Forest.


Для создания ROC-кривый модели воспользуемся аргументами поиска, которые предаставляет нам плагин Splunk ML Toolkit, как показано на рисунке 5 для метода классификации Random Forest.

![roc-curve](https://user-images.githubusercontent.com/49113443/146676548-588ae48a-a299-4b26-85d7-f5d5c6542415.png)
Рисунок 5 - ROC-кривые для метода Random Forest.

Confusion Matrix и ROC-кривые для методов классификации Logistic Regression, SVM, Decision Tree, представлены на рисунках 6 и 7, 8 и 9, а также 10 и 11 соответственно.


![logistic-regression-conf-matrix](https://user-images.githubusercontent.com/49113443/146676685-735d0933-e287-4026-9e5a-a1aa0ad7a49a.png)
Рисунок 6 - Результат работы модели и Confusion Matrix для метода Logistic Regression.

![logistic-regression-roc](https://user-images.githubusercontent.com/49113443/146676712-97596b4a-e6a7-4fc8-ad95-e5614d08d33b.png)
Рисунок 7 - ROC-кривые для метода Logistic Regression.


![svm-conf-matrix](https://user-images.githubusercontent.com/49113443/146676741-d41a03b5-967a-408e-a9d1-006af7142107.png)
Рисунок 8 - Результат работы модели и Confusion Matrix для метода SVM.

![svm-roc](https://user-images.githubusercontent.com/49113443/146676752-74a8cce9-e7d9-4c74-880a-3a32f3185e1b.png)
Рисунок 9 - ROC-кривые для метода SVM.

![desc-tree-conf-matrix](https://user-images.githubusercontent.com/49113443/146676790-4470d732-3fdf-4477-a4a4-6ea45aad4f94.png)
Рисунок 10 - Результат работы модели и Confusion Matrix для метода Decision Tree.

![desc-tree-roc](https://user-images.githubusercontent.com/49113443/146676794-1ee545cd-d787-481c-9637-a5eded3a9778.png)
Рисунок 11 - ROC-кривые для метода Decision Tree.

