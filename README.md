## Setup
1) Install dependencies with `bundle install`
2) Configure your database settings in `config/database.yml`
3) Build your database with `rails db:setup db:seed`
4) Start your rails server with `rails server`

## Testing
You can hit API endpoints via commandline with curl:

GET: `curl localhost:3000/users`

POST: `curl -H "Content-Type: application/json" -d '{"username":"daenerys", "first_name":"daenerys", "last_name":"targaryen"}' localhost:3000/users`

## API Documentation

### Kudos
**Request:**

`GET /kudos` - list all received kudos of currently logged-in user

**Response**: 

`200 OK`

`Content-Type: application/json`

*Body*:

```json
[
    {
        "created_at": "2017-09-12T21:18:27.321Z",
        "giver_id": 1,
        "id": 1,
        "receiver_id": 1,
        "text": "Test Kudo",
        "updated_at": "2017-09-12T21:18:27.321Z"
    },
    {
        "created_at": "2017-09-12T21:34:04.793Z",
        "giver_id": 1,
        "id": 2,
        "receiver_id": 1,
        "text": "Test Kudo",
        "updated_at": "2017-09-12T21:34:04.793Z"
    }
]
```

**Request**:

`GET /users/:user_id/kudos` - list all received kudos of user_id

*Parameters*:

`user_id` - integer ID of user who you wish to get kudos for

**Response**: 

`200 OK`

`Content-Type: application/json`

*Body*:

```json
[
    {
        "created_at": "2017-09-12T21:18:27.321Z",
        "giver_id": 1,
        "id": 1,
        "receiver_id": 1,
        "text": "Test Kudo",
        "updated_at": "2017-09-12T21:18:27.321Z"
    },
    {
        "created_at": "2017-09-12T21:34:04.793Z",
        "giver_id": 1,
        "id": 2,
        "receiver_id": 1,
        "text": "Test Kudo",
        "updated_at": "2017-09-12T21:34:04.793Z"
    }
]
```

**Request**: 

`GET /users/:user_id/kudos` - list all received kudos of user_id

*Parameters*:

`user_id` - integer ID of user who you wish to get kudos for

**Response**: 

`200 OK`

`Content-Type: application/json`

*Body*:

```json
[
    {
        "created_at": "2017-09-12T21:18:27.321Z",
        "giver_id": 1,
        "id": 1,
        "receiver_id": 1,
        "text": "Test Kudo",
        "updated_at": "2017-09-12T21:18:27.321Z"
    },
    {
        "created_at": "2017-09-12T21:34:04.793Z",
        "giver_id": 1,
        "id": 2,
        "receiver_id": 1,
        "text": "Test Kudo",
        "updated_at": "2017-09-12T21:34:04.793Z"
    }
]
```

**Request**:

`POST /kudos` - create a new kudos record

*Body*:

```json
{
  "text": "This is a kudo",
  "receiver_id": 1,
  "giver_id: 2
}
```

**Response**: 

`201 Created`

`Content-Type: application/json`

*Body*:

```json
{
    "created_at": "2017-09-12T22:28:14.304Z",
    "giver_id": 2,
    "id": 1,
    "receiver_id": 1,
    "text": "This is a kudo",
    "updated_at": "2017-09-12T22:28:14.304Z"
}
```

**Request**:

`DELETE /kudos/:id` - delete a kudos record

*Parameters*:  

`id` - integer ID of the kudo you wish to delete

**Response**:

`204 No Content`

### Users

**Request**:

`GET /users` - list all user records

**Response**: 

`200 OK`

`Content-Type: application/json`

*Body*:

```json
[
    {
        "created_at": "2017-09-12T21:17:31.908Z",
        "id": 1,
        "kudos_given_count": 4,
        "kudos_received_count": 4,
        "updated_at": "2017-09-12T21:17:31.908Z",
        "username": "daenerys",
        "first_name": "Daenerys",
        "last_name": "Targaryen"
    }
]
```

**Request**:

`POST /user` - create a new user record

*Body*:

```json
{
  "username": "daenerys",
  "first_name": "Daenerys",
  "last_name": "Targaryen"
}
```

**Response**: 

`201 Created`

`Content-Type: application/json`

*Body*:

```json
{
    "created_at": "2017-09-12T22:33:49.495Z",
    "id": 2,
    "kudos_given_count": 1,
    "kudos_received_count": 1,
    "updated_at": "2017-09-12T22:33:49.495Z",
    "username": "daenerys",
    "first_name": "Daenerys",
    "last_name": "Targaryen"
}
```

**Request**:

`GET /users/:id` - get user info for ID

*Parameters*:

`id` - integer ID of the user you wish to get

**Response**: 

`200 OK`

`Content-Type: application/json`

*Body*:

```json
{
    "created_at": "2017-09-12T22:33:49.495Z",
    "id": 2,
    "kudos_given_count": 1,
    "kudos_received_count": 1,
    "updated_at": "2017-09-12T22:33:49.495Z",
    "username": "daenerys",
    "first_name": "Daenerys",
    "last_name": "Targaryen"
}
```

**Request**:

`GET /users/me` - get user info for "logged in" user *

_* Server-side authentication is not currently implemented, but for this project's purposes you can assume this is the logged-in, authenticated user._

*Parameters*:

None

**Response**:

See `GET /users/:id`

*Body*:

See `GET /users/:id`
