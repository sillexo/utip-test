# utip-test
## Задачи
#### На языке php (допустимо использование популярных фреймворков) реализовать REST API в соответствии со следующими требованиями:
1. Создать 4 модели. Одна из моделей должна быть «Пользователь». Остальные модели на усмотрение разработчика. 
2. Должны быть реализованы связи 1:1, 1:M, M:M.
3. Реализовать валидацию полей в каждой модели.
4. Вызов API-методов должен быть доступен только авторизованным пользователям.
5. Реализовать CRUD-операции для каждой из моделей.
6. Реализовать возможность расширения модели дополнительными параметрами в GET-запросах.
7. Реализовать возможность получения связей моделей.
8. Реализовать права доступа. Например, создание модели A доступно всем пользователям, кроме заблокированных, при этом получение доступно абсолютно всем пользователям. Управление моделями B и C доступно только пользователям, с ролью (либо правом) администратора.
9. Реализовать сортировки и фильтры для каждой из моделей.
10. Приложить инструкцию по разворачиванию проекта.

#### Дополнительные задания
1. Реализовать расширение моделей вложенными связями.
2. Реализовать регистрацию пользователей с подтверждением через email
3. Добавить возможность привязки изображений (или любых файлов) к одной из моделей. Хранение изображений должно быть в файловой системе. При этом исключить дублирование одинаковых изображений.
4. Сформировать простую документацию по использованию API-методов, либо readme-файл.
5. Реализовать механизм кеширования.

## Установка
```sh
$ composer install

# Установка миграций
$ php artisan migrate --seed
```

### Настройка mail
Файл .env

## Модели
* User
  * name
  * email
  * password
  * status
  
* Role
  * name
  * display_name
 
* Profile
  * user_id
  * address
  * phone
  
* Article
  * title
  * image
  * author_id
  
* Comment
  * body
  * author_id
  * article_id

### Отношения
#### Один к одному
User - Profile

#### Один ко многим
User - Article

Article - Comment

#### Многие ко многим
User - Role

## Реализовано
* Валидация
* Вызов API-методов доступен только авторизованным пользователям
* CRUD-операции для каждой из моделей (см. ниже)
* Получение связей моделей (см. ниже)
* Права доступа
  * Просмотр Comment доступен всем пользователям, создание, редактирование кроме заблокированных
  * Создание, редактирование Article доступен менеджерам и админу
  * Доступ к User, Role имеет только админ
* Сортировка, фильтрация (см. ниже)
* Регистрация пользователей с подтверждением через email (см. ниже)
* Кеширование
* Добавление к модели Article изображения с сохранением на сервере

## Список адресов с методами Api

Вход
```php
// админ
email => admin@test.com
password => password
// менеджер
email => manager@test.com
password => password
// пользователь
email => user@test.com
password => password
// заблокированный пользователь
email => blocked_user@test.com
password => password
```

Авторизация, получение Bearer token
```http
POST /api/login
email => admin@test.com
password => password
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC91dGlwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNTk2NDIxNTYyLCJleHAiOjE1OTY1MDc5NjIsIm5iZiI6MTU5NjQyMTU2MiwianRpIjoiYlJDeE1vNE9YVUJQNEx4WCIsInN1YiI6MSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.nbPdr8sHMfc_9vXzKiuG0D5qjwxTm0YAktyeBOpkrOE",
    "token_type": "bearer",
    "expires_in": 86400
}
```

Регистрация, отправка email для подтверждения
```http
POST /api/register
```

Обновление token
```http
GET /api/refresh
```

### Users Api

```http
List Users
GET /api/users

Create Users
POST /api/users

Show Users
GET /api/users/{id}

Update Users
PUT /api/users/{id}

Delete Users
DELETE /api/users/{id}
```

#### Sorting and filters

```http
Paginate Users
GET /api/users?paginate=25 // Default 25

Paginate Users
GET /api/users?orderBy=ASC // Default ASC

Paginate Users
GET /api/users?sortBy=created_at // Default created_at

Filter Users by name
GET /api/users?filter[name]=User Name

Filter Users by email
GET /api/users?filter[email]=email@mail.ru
```

### Roles Api

```http
List Roles
GET /api/roles

Create Roles
POST /api/roles

Show Roles
GET /api/roles/{id}

Update Roles
PUT /api/roles/{id}

Delete Roles
DELETE /api/roles/{id}
```

#### Sorting and filters
```http
Paginate Roles
GET /api/roles?paginate=25 // Default 25

Paginate Roles
GET /api/roles?orderBy=ASC // Default ASC

Paginate Roles
GET /api/roles?sortBy=name // Default name

Filter Roles by name
GET /api/roles?filter[name]=Role Name
```

### Articles Api

```http
List Articles
GET /api/articles

Create Articles
POST /api/articles

Show Articles
GET /api/articles/{id}

Update Articles
PUT /api/articles/{id}

Delete Articles
DELETE /api/articles/{id}
```

#### Получение связей моделей:
```http
GET /api/articles/{article}/author
GET /api/articles/{article}/comments
GET /api/articles/{article}/relationships/author
GET /api/articles/{article}/relationships/comments
```

#### Sorting and filters
```http
Paginate Articles
GET /api/articles?paginate=25 // Default 25

Paginate Articles
GET /api/articles?orderBy=ASC // Default ASC

Paginate Articles
GET /api/articles?sortBy=created_at // Default created_at

Filter Articles by author_id
GET /api/articles?filter[author_id]=5

Filter Articles by title
GET /api/articles?filter[title]=Article Title
```

### Comments Api
```http
List Comments
GET /api/comments

Create Comments
POST /api/comments

Show Comments
GET /api/comments/{id}

Update Comments
PUT /api/comments/{id}

Delete Comments
DELETE /api/comments/{id}
```

#### Sorting and filters

```http
Paginate Comments
GET /api/comments?paginate=25 // Default 25

Paginate Comments
GET /api/comments?orderBy=ASC // Default ASC

Paginate Comments
GET /api/comments?sortBy=created_at // Default created_at

Filter Comments by author_id
GET /api/comments?filter[author_id]=5

Filter Comments by article_id
GET /api/comments?filter[article_id]=3
```
