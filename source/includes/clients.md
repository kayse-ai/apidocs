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
    "title": "Mr.",
    "first_name": "John",
    "middle_name": "Michael",
    "last_name": "Doe",
    "former_last_name": "Smith",
    "suffix": "Jr.",
    "nickname": "Johnny",
    "alias": "JD",
    "gender": "male",
    "date_of_birth": "1990-01-15",
    "marital_status": "single",
    "social_security": "123-45-6789",
    "occupation": "Software Engineer",
    "employer": "Tech Corp",
    "citizen_ship": "US",
    "residency_status": "citizen",
    "language_preference": "en",
    "is_minor": false,
    "is_deceased": false,
    "is_homeless": false,
    "medical_condition": "None",
    "legal_history": "None",
    "city": "New York",
    "state": "NY",
    "postal_code": "10001",
    "address_line1": "123 Main St",
    "address_line2": "Apt 4B",
    "timezone": "America/New_York",
    "voice_calls_opted_out": false,
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
| title                | false    | String  | Honorific title (e.g., "Mr.", "Dr.", "Ms.")              |
| first_name           | true     | String  | Client's first name                                       |
| middle_name          | false    | String  | Client's middle name                                      |
| last_name            | true     | String  | Client's last name                                        |
| former_last_name     | false    | String  | Client's former last name                                 |
| suffix               | false    | String  | Name suffix (e.g., "Jr.", "Sr.", "III")                  |
| nickname             | false    | String  | Client's nickname                                         |
| alias                | false    | String  | Client's alias                                            |
| gender               | false    | String  | Client's gender                                           |
| date_of_birth        | false    | Date    | Client's date of birth (YYYY-MM-DD format)               |
| marital_status       | false    | String  | Client's marital status                                   |
| social_security      | false    | String  | Social security number                                    |
| occupation           | false    | String  | Client's occupation                                       |
| employer             | false    | String  | Client's employer                                         |
| citizen_ship         | false    | String  | Client's citizenship                                      |
| residency_status     | false    | String  | Client's residency status                                 |
| language_preference  | false    | String  | Preferred language code                                   |
| is_minor             | false    | Boolean | Whether client is a minor                                |
| is_deceased          | false    | Boolean | Whether client is deceased                               |
| is_homeless          | false    | Boolean | Whether client is homeless                               |
| medical_condition    | false    | String  | Medical conditions                                        |
| legal_history        | false    | String  | Legal history information                                 |
| city                 | false    | String  | City of residence                                         |
| state                | false    | String  | State of residence                                        |
| postal_code          | false    | String  | Postal/ZIP code                                           |
| address_line1        | false    | String  | Primary address line                                      |
| address_line2        | false    | String  | Secondary address line                                    |
| timezone             | false    | String  | Client's timezone                                         |
| voice_calls_opted_out| false    | Boolean | Whether client has opted out of voice calls              |
| date_of_death        | false    | Date    | Date of death (YYYY-MM-DD format)                        |
| meta                 | false    | Object  | Additional metadata as key-value pairs                   |
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
    "voice_calls_opted_out": false,
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

All fields from the create request are optional for updates. Only include the fields you want to modify.

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
    "message": "Client deleted successfully"
}
```

### URL Parameters

| Field | Required | Type   | Description                    |
|-------|----------|--------|--------------------------------|
| id    | true     | Integer| The unique identifier of the client |