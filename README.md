## Ruby
Studing Ruby
'<<' means add to the end of the array

## Орг вопросы

<!-- По любым орг. вопросам можете писать на friends@thinknetica.com, а по техническим задавать вопросы в чате своим наставникам или на встречах. -->

<!-- И еще один важный момент: При повторной сдаче задания после проверки и исправления замечаний, необходимо сдавать задание как новый ответ, а не как комментарий к пердыдущему ответу. Только в этом случае наставники увидят ваше задание в системе и смогут его принять/отклонить. -->

<!-- Курс "Основы Ruby" (срок прохождения - 6 недель)
    Курс "Основы Rails" (срок прохождения - 9 недель)
    Курс "Продвинутый Rails" (срок прохождения - 10 недель) -->

<!-- На первом блоке, который начнется сегодня, наставником у вас будет Анатолий Куричев (ник в телеграме: @matrosso). -->

<!-- Все задания должны оформляться как Pull Request на Github, чтобы это сделать вам нужно:-->

    1. Создать новый репозиторий для этого курса на Github
    2. Склонировать его себе на локальную машину
    3. Создать новую ветку от master для задания (для каждого задания нужно создавать отдельную ветку)
    4. Выполнить задание в этой ветке. В процессе можно делать любое кол-во коммитов.
    5. Запушить ветку на Github
    6. Через интерфейс Github создать Pull Request (далее - PR) между веткой master и вашей веткой
    7. Сдать ссылку на PR в качестве ответа на задание
    8. После того, как задание будет принято, смержить изменеия в master (в терминале или через интерфейс Github), не забудьте потом отправить изменения в master на сервере (если делали merge локально) или обновить локальный мастер (если делали merge на Github)
    9. Новое задание начинаете с п. 3
    
    Посмотрите это видео (https://vimeo.com/238790499/5e4b47d3bc), в котором показывается, как работать с ветками и создавать Pull Request 

## About git
<!-- git branch -m <branch> -->
Изменение имени текущей ветки на ＜ветка＞.
<!-- git checkout -b <new_branch>  <old_branch> -->
создать новую ветку и скопировать туда данные из старой
<!-- git branch -d <branch-name> -->
удалить локалльную ветку

## Shortcuts

<!-- delete line -->
cntr+shift+K 
<!-- copy line up or down -->
cntr+shift+arrow 
<!-- Add cursor up/down -->
shift+alt+arrow #esc to cansel

## Lesson 1. Foundation of object OOP

Let’s say that you have a class with instance variables & you want to expose them to the outside world.
How?
You have to define a method.
Only methods can access instance variables.
Why?
Because you’ll get an error if you don’t do this.

hence

<!-- attr_reader, attr_writer, attr_acessor -->
## Lesson 2. Interfaces, Iheritance, Polyformism

<!-- key word: public -->
доступны из-вне класса и являются интерфейсом класса
<!-- key word: protected -->
доступны в подклассахб не доступны из-вне
Использовать, если есть наследование
<!-- key word: private -->
не позволяет вызывать методы через self.

Если хочешь, чтобы метод не был доступен в подклассах, то используешь его (хотя они будут доступны все равно)
Просто просишь, чтобы не использовали (не рекомендуется)

Также оно используется, если нет наследования
<!-- Частичное изменение функционала у класса -->
если надо добавить функционал, то используешь ключевое слово:
super (c аргументами, если они были в исходном классе)
и потом дописываешь новый функционал
<!-- Подключение классов в файлах -->
require 'absolute_path to file'
require_relative 'relative path to file'
<!-- Подгружать файлы в irb -->
 $ irb -r ./<file>.rb

## Lesson 3. Методы класса. Объекная модель
<!-- class << self ... end -->
внутри такой конструкции в классе все методы будут методами класса и не будут доступны инстанс переменным
<!-- def self.<method_name> ... end -->
аналогичное определение метода класса
<!-- переменная класса -->
доступны для всех инстансов класса, для детей класса. Нпример используешь переменную класса для счета инстанса класса
объявление такой переменной через @@
<!-- Методы класса. Вызов -->
Методы класса можно вызывать внутри класса, но не внутри методов объекта класса!!! (если чисто по названию метода класса)
Методы класса в методе объекта класса вызываются, как 
self.class.<имя_метода_класса>
<!-- Модули класса -->
Содержат в себе
    - пространство имен (для исключения конфликтов в случае, когда имена у классов совпадают)
    - логику без классов
    - миксины (разделяют код между классами)
    <!-- Пространство имен -->
    В пространстве имен тоже лежат классы. Полезно, если например нужен тот же класс, но с другим функционалом
    (например module Admin ... end содержит в себе класс Car. И с помощью такой штуки можно делать классы, которые например обладают админ правами (из-за другого функционала))
    вызов такого класса Admin::Car
    Есть более короткая запись такой конструкции: class Admin(модуль)::Car (название класса)
    <!-- Хранилище логики -->
    ---
    <!-- Миксины -->
    Общий код классов выделяется в модули
    private, protected тоже есть
    include <name> - подключает модуль в классе как инстанс методы

    Если в модули выносить общие  методы класса, то это делается через "extend"

    Можно еще в модули выносить и методы класса и методы объектов класса
        module ClassMethods; module InstanceMethods 
    Чтобы подключить такие модули в классе нужно добавлять '::' после названия родительского метода
    
    Есть упрощенный способ подключения модулей. (программа пише т саму себя). Не писать длинные контрукции для подключения 
<!-- Условный оператор ||= -->
a ||= b is a conditional assignment operator. It means:

if a is undefined or falsey, then evaluate b and set a to the result.
Otherwise (if a is defined and evaluates to truthy), then b is not evaluated, and no assignment takes place.

## Exceptions 

begin
...
rescue Exception (баз класс для всех ошибок) => NAME (название переменной где будет объект ошибки)
end

методы объекта NAME:
massage
backtrace (лог, как ошибка возникла)
inspect

Еще есть raise
    raise <ErrorName> (она отправляет в begin обработки ошибки)

Есть еще retry (повторяет выполнение с бегин)

begin
...
rescue
...
ensure (выполняется в любом случае)
..
end

<!-- Для валидаций данных: -->
задача регулярных выражений через '/<символы>/'
e.g.: example = /.*/
\d - число
* - необязательный символ*
. - как минимум один символ
^ - до этого сивола не должно быть строки
$ - конец строки
i - в конце строки, чтобы не быть чувствительны к регистру
совпадение строки с регулярным выражением через  '=~', не совпадение: !~
rubular.com посмотреть регулярные выражения
сравнение через =~ возвращает номер элемента в стринг эррей, с которого начинается совпадение с регулярным выражением

## Blocks, proc, lambda

для сохранения кода блока в переменную используется
    x = Proc.new {код блока} # например {|x| x = x*10; puts x}
    или просто proc
    или lambda (производится проверка кол-ва аргументов)

    вызов кода в блоке через .call(<переменные>)

есть еще такие конструкции:
    def method(аргументы)
        yield(фргументы) #хватаеn блок?
    end
    def m (arg*, &block) # лучше с амперсантом, тогда вызов будет m(args) {код блока}
        block.call
    end
использование: method {код блока}

## Metaprogs

eval() выполняет любой код в скобках
для создания новый методов у класса используется instance_eval или можно через обращение к классу (class_eval) создавать методы у инстанс
есть еще (имя объека или инстанса или класса)_variable_get/set
set #переменная #значение

объявляем метод, который создает другие методы
define_method(:method_name)
end

метапрограммирование принемает в качестве названий тип символ .to_sym!!!