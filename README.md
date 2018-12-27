To setup server run the following command:

```
ruby setup_server.rb
```

It's making bundle install, creating DB, migration DB, seeding DB and starts the server.

After server started visit http://127.0.0.1:9393

To run server afterwards use command `shotgun`

1) Use `?` in search term
Example:
```
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://127.0.0.1:9393/addressbook/person/search/?first_name=John
```

2) Example of 2 method:
```
curl -i -H "Accept: application/jsoon/json" -X GET http://127.0.0.1:9393/addressbook/person/4
```

3) Example of 3 method:
```
curl -i -X POST -H "Content-Type: application/json" -d'{"first_name":"Pedro","second_name":"Tansey","address":"KEESEVILLE, 2067  Arthur Avenue", "phone_number":"815-797-5535"}' http://127.0.0.1:9393/addressbook/person
```