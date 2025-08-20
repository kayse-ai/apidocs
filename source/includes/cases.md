# Cases

## Create a new case

```shell
curl --location --request POST 'https://api.kayse.com/v1/cases' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
    "case_number": "CASE-2024-001",
    "external_source": "other",
    "external_source_id": "ext_case_123",
    "external_source_data": {
        "court_id": "NYC001",
        "filing_date": "2024-01-15",
        "case_type": "civil"
    },
    "name": "Smith vs. Johnson",
    "court_name": "New York Supreme Court",
    "jurisdiction": "New York",
    "description": "Contract dispute regarding service delivery",
    "status": "active",
    "type": "civil",
    "is_obo": false,
    "created_date": "2024-01-15",
    "court_date": "2024-03-20",
    "end_date": null,
    "client_id": 123
}'
```

### HTTP Request

`POST https://api.kayse.com/v1/cases`

> The above command returns JSON structured like this:

```json
{
    "id": 456,
    "case_number": "CASE-2024-001",
    "external_source": "other",
    "external_source_id": "ext_case_123",
    "external_source_data": {
        "court_id": "NYC001",
        "filing_date": "2024-01-15",
        "case_type": "civil"
    },
    "name": "Smith vs. Johnson",
    "court_name": "New York Supreme Court",
    "jurisdiction": "New York",
    "description": "Contract dispute regarding service delivery",
    "status": "active",
    "type": "civil",
    "is_obo": false,
    "created_date": "2024-01-15",
    "court_date": "2024-03-20",
    "end_date": null
}
```

### Request Body Fields

| Field                | Required | Type    | Description                                               |
|----------------------|----------|---------|-----------------------------------------------------------|
| case_number          | true     | String  | Unique case identifier                                    |
| external_source      | true     | String  | Source system identifier (a static list defined in-app)   |
| external_source_id   | true     | String  | Unique identifier from external source                    |
| external_source_data | false    | Object  | Additional data from external source as key-value pairs   |
| name                 | false    | String  | Case name/title                                           |
| court_name           | false    | String  | Name of the court                                         |
| jurisdiction         | false    | String  | Legal jurisdiction                                        |
| description          | false    | String  | Case description                                          |
| status               | true     | String  | Case status (e.g., "active", "closed", "pending")         |
| type                 | true     | String  | Case type (e.g., "civil", "criminal", "family")           |
| is_obo               | false    | Boolean | Whether case is "on behalf of" another party              |
| created_date         | false    | Date    | Case creation date (YYYY-MM-DD format)                    |
| court_date           | false    | Date    | Next court date (YYYY-MM-DD format)                       |
| end_date             | false    | Date    | Case end date (YYYY-MM-DD format)                         |
| client_id            | false    | Integer | Associated client ID                                      |

## Get a case by ID

```shell
curl --location --request GET 'https://api.kayse.com/v1/cases/456' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}'
```

### HTTP Request

`GET https://api.kayse.com/v1/cases/{id}`

> The above command returns JSON structured like this:

```json
{
    "id": 456,
    "case_number": "CASE-2024-001",
    "external_source": "other",
    "external_source_id": "ext_case_123",
    "external_source_data": {
        "court_id": "NYC001",
        "filing_date": "2024-01-15",
        "case_type": "civil"
    },
    "name": "Smith vs. Johnson",
    "court_name": "New York Supreme Court",
    "jurisdiction": "New York",
    "description": "Contract dispute regarding service delivery",
    "status": "active",
    "type": "civil",
    "is_obo": false,
    "created_date": "2024-01-15",
    "court_date": "2024-03-20",
    "end_date": null
}
```

### URL Parameters

| Field | Required | Type   | Description                    |
|-------|----------|--------|--------------------------------|
| id    | true     | Integer| The unique identifier of the case |

## Update a case

```shell
curl --location --request PUT 'https://api.kayse.com/v1/cases/456' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
    "case_number": "CASE-2024-001",
    "external_source": "other",
    "external_source_id": "ext_case_123",
    "external_source_data": {
        "court_id": "NYC001",
        "filing_date": "2024-01-15",
        "case_type": "civil"
    },
    "name": "Smith vs. Johnson",
    "court_name": "New York Supreme Court",
    "jurisdiction": "New York",
    "description": "Contract dispute regarding service delivery",
    "status": "active",
    "type": "civil",
    "is_obo": false,
    "created_date": "2024-01-15",
    "court_date": "2024-03-20",
    "end_date": null
}'
```

### HTTP Request

`PUT https://api.kayse.com/v1/cases/{id}`

> The above command returns JSON structured like this:

```json
{
    "id": 456,
    "case_number": "CASE-2024-001",
    "external_source": "other",
    "external_source_id": "ext_case_123",
    "external_source_data": {
        "court_id": "NYC001",
        "filing_date": "2024-01-15",
        "case_type": "civil",
        "resolution": "settlement",
        "settlement_amount": 50000
    },
    "name": "Smith vs. Johnson",
    "court_name": "New York Supreme Court",
    "jurisdiction": "New York",
    "description": "Case resolved through settlement",
    "status": "closed",
    "type": "civil",
    "is_obo": false,
    "created_date": "2024-01-15",
    "court_date": "2024-03-20",
    "end_date": "2024-06-15"
}
```

### URL Parameters

| Field | Required | Type   | Description                    |
|-------|----------|--------|--------------------------------|
| id    | true     | Integer| The unique identifier of the case |

### Request Body Fields

Keep in mind that this is a PUT endpoint (NOT PATCH), and thus all optional fields that were ommited will be set as null.

| Field                | Required | Type    | Description                                               |
|----------------------|----------|---------|-----------------------------------------------------------|
| case_number          | true     | String  | Unique case identifier                                    |
| external_source      | true     | String  | Source system identifier (a static list defined in-app)   |
| external_source_id   | true     | String  | Unique identifier from external source                    |
| external_source_data | false    | Object  | Additional data from external source as key-value pairs   |
| name                 | false    | String  | Case name/title                                           |
| court_name           | false    | String  | Name of the court                                         |
| jurisdiction         | false    | String  | Legal jurisdiction                                        |
| description          | false    | String  | Case description                                          |
| status               | true     | String  | Case status (e.g., "active", "closed", "pending")         |
| type                 | true     | String  | Case type (e.g., "civil", "criminal", "family")           |
| is_obo               | false    | Boolean | Whether case is "on behalf of" another party              |
| created_date         | false    | Date    | Case creation date (YYYY-MM-DD format)                    |
| court_date           | false    | Date    | Next court date (YYYY-MM-DD format)                       |
| end_date             | false    | Date    | Case end date (YYYY-MM-DD format)                         |

## Delete a case

```shell
curl --location --request DELETE 'https://api.kayse.com/v1/cases/456' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}'
```

### HTTP Request

`DELETE https://api.kayse.com/v1/cases/{id}`

> The above command returns JSON structured like this:

```json
{
    "message": "case deleted successfully"
}
```

### URL Parameters

| Field | Required | Type   | Description                    |
|-------|----------|--------|--------------------------------|
| id    | true     | Integer| The unique identifier of the case |

## Send SMS to Client + Case

```shell
curl --location --request POST 'https://api.kayse.com/v1/cases/communication/sms' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
    "case_id": 123,
    "client_id": 123,
    "message": "hello from kayse"
}'
```

> The above command returns JSON structured like this:

```json
{
    "message": "sms scheduled"
}
```

### Request Body Fields

| Field     | Required | Type     | Description                                              |
|-----------|----------|----------|----------------------------------------------------------|
| case_id   | true     | Integer  | Unique case identifier                                   |
| client_id | true     | Integer  | Unique cliet identifier                                  |
| message   | true     | String   | Message to be sent, may contain Kayse template variables |

## Send Email to Client + Case

```shell
curl --location --request POST 'https://api.kayse.com/v1/cases/communication/email' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
    "case_id": 123,
    "client_id": 123,
    "subject": "hello from kayse",
    "message": "hello from kayse"
}'
```

> The above command returns JSON structured like this:

```json
{
    "message": "email scheduled"
}
```

### Request Body Fields

| Field     | Required | Type     | Description                                              |
|-----------|----------|----------|----------------------------------------------------------|
| case_id   | true     | Integer  | Unique case identifier                                   |
| client_id | true     | Integer  | Unique cliet identifier                                  |
| subject   | true     | String   | Subject of the email to be sent                          |
| message   | true     | String   | Message to be sent, may contain Kayse template variables |