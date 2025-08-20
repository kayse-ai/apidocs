# Clients

## Create a new client

```shell
curl --location --request POST 'https://api.kayse.com/v1/clients' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "john.doe@example.com",
    "mobile": "+1234567890",
    "external_source": "manual",
    "external_source_id": "ext_123",
    "first_name": "John",
    "last_name": "Doe",
    "date_of_birth": "1990-01-15",
    "city": "New York",
    "state": "NY",
    "postal_code": "10001",
    "address_line1": "123 Main St",
    "address_line2": "Apt 4B",
    "date_of_death": null,
    "meta": {
        "notes": "Client prefers email communication",
        "source": "website"
    },
    "case_id": 12345
}'
```

### HTTP Request

`POST https://api.kayse.com/v1/clients`

> The above command returns JSON structured like this:

```json
{
    "id": 123,
    "email": "john.doe@example.com",
    "mobile": "+1234567890",
    "external_source": "manual",
    "external_source_id": "ext_123",
    "first_name": "John",
    "last_name": "Doe",
    "gender": "male",
    "date_of_birth": "1990-01-15",
    "city": "New York",
    "state": "NY",
    "postal_code": "10001",
    "address_line1": "123 Main St",
    "address_line2": "Apt 4B",
    "voice_calls_opted_out": false,
    "date_of_death": null,
    "meta": {
        "notes": "Client prefers email communication",
        "source": "website"
    }
}
```

### Request Body Fields

| Field                | Required | Type    | Description                                               |
|----------------------|----------|---------|-----------------------------------------------------------|
| email                | false    | String  | Client's email address                                    |
| mobile               | false    | String  | Client's mobile phone number                              |
| external_source      | true     | String  | Source system identifier (e.g., "manual", "import")       |
| external_source_id   | true     | String  | Unique identifier from external source                    |
| first_name           | true     | String  | Client's first name                                       |
| last_name            | true     | String  | Client's last name                                        |
| date_of_birth        | false    | Date    | Client's date of birth (YYYY-MM-DD format)                |
| city                 | false    | String  | City of residence                                         |
| state                | false    | String  | State of residence                                        |
| postal_code          | false    | String  | Postal/ZIP code                                           |
| address_line1        | false    | String  | Primary address line                                      |
| address_line2        | false    | String  | Secondary address line                                    |
| date_of_death        | false    | Date    | Date of death (YYYY-MM-DD format)                         |
| meta                 | false    | Object  | Additional metadata as key-value pairs                    |
| case_id              | false    | Integer | Associated case ID                                        |

## Get a client by ID

```shell
curl --location --request GET 'https://api.kayse.com/v1/clients/123' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}'
```

### HTTP Request

`GET https://api.kayse.com/v1/clients/{id}`

> The above command returns JSON structured like this:

```json
{
    "id": 123,
    "email": "john.doe@example.com",
    "mobile": "+1234567890",
    "external_source": "manual",
    "external_source_id": "ext_123",
    "first_name": "John",
    "last_name": "Doe",
    "gender": "male",
    "date_of_birth": "1990-01-15",
    "city": "New York",
    "state": "NY",
    "postal_code": "10001",
    "address_line1": "123 Main St",
    "address_line2": "Apt 4B",
    "date_of_death": null,
    "meta": {
        "notes": "Client prefers email communication",
        "source": "website"
    }
}
```

### URL Parameters

| Field | Required | Type   | Description                    |
|-------|----------|--------|--------------------------------|
| id    | true     | Integer| The unique identifier of the client |

## Update a client

```shell
curl --location --request PUT 'https://api.kayse.com/v1/clients/123' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "john.doe.updated@example.com",
    "mobile": "+1234567890",
    "city": "Los Angeles",
    "state": "CA",
    "postal_code": "90210",
    "address_line1": "456 Oak Ave",
    "meta": {
        "notes": "Updated contact information",
        "source": "website"
    }
}'
```

### HTTP Request

`PUT https://api.kayse.com/v1/clients/{id}`

> The above command returns JSON structured like this:

```json
{
    "id": 123,
    "email": "john.doe.updated@example.com",
    "mobile": "+1234567890",
    "external_source": "manual",
    "external_source_id": "ext_123",
    "first_name": "John",
    "last_name": "Doe",
    "gender": "male",
    "date_of_birth": "1990-01-15",
    "city": "Los Angeles",
    "state": "CA",
    "postal_code": "90210",
    "address_line1": "456 Oak Ave",
    "address_line2": "Apt 4B",
    "voice_calls_opted_out": false,
    "date_of_death": null,
    "meta": {
        "notes": "Updated contact information",
        "source": "website"
    }
}
```

### URL Parameters

| Field | Required | Type   | Description                    |
|-------|----------|--------|--------------------------------|
| id    | true     | Integer| The unique identifier of the client |

### Request Body Fields

Keep in mind that this is a PUT endpoint (NOT PATCH), and thus all optional fields that were ommited will be set as null.

| Field                | Required | Type    | Description                                               |
|----------------------|----------|---------|-----------------------------------------------------------|
| email                | false    | String  | Client's email address                                    |
| mobile               | false    | String  | Client's mobile phone number                              |
| external_source      | true     | String  | Source system identifier (e.g., "manual", "import")       |
| external_source_id   | true     | String  | Unique identifier from external source                    |
| first_name           | true     | String  | Client's first name                                       |
| last_name            | true     | String  | Client's last name                                        |
| date_of_birth        | false    | Date    | Client's date of birth (YYYY-MM-DD format)                |
| city                 | false    | String  | City of residence                                         |
| state                | false    | String  | State of residence                                        |
| postal_code          | false    | String  | Postal/ZIP code                                           |
| address_line1        | false    | String  | Primary address line                                      |
| address_line2        | false    | String  | Secondary address line                                    |
| date_of_death        | false    | Date    | Date of death (YYYY-MM-DD format)                         |
| meta                 | false    | Object  | Additional metadata as key-value pairs                    |
| case_id              | false    | Integer | Associated case ID                                        |

## Delete a client

```shell
curl --location --request DELETE 'https://api.kayse.com/v1/clients/123' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}'
```

### HTTP Request

`DELETE https://api.kayse.com/v1/clients/{id}`

> The above command returns JSON structured like this:

```json
{
    "message": "client deleted successfully"
}
```

### URL Parameters

| Field | Required | Type   | Description                    |
|-------|----------|--------|--------------------------------|
| id    | true     | Integer| The unique identifier of the client |