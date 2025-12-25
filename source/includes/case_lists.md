# Case Lists

Case lists allow you to save reusable case filters that power campaigns and autom autom automations. The endpoints below mirror the public API routes exposed under `/v1/case_lists`.

## List case lists

```shell
curl --location --request GET 'https://api.kayse.com/v1/case_lists?key=mass+tort' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}'
```

### HTTP Request

`GET https://api.kayse.com/v1/case_lists`

### Query Parameters

| Field      | Required | Type   | Description                                                     |
|------------|----------|--------|-----------------------------------------------------------------|
| key        | false    | String | Optional search term applied to the case list name              |
| page       | false    | Int    | Page number (defaults to 1)                                     |
| page_size  | false    | Int    | Results per page (defaults to 25, max 100)                      |
| hide_empty | false    | Bool   | When true, only returns lists that currently contain case IDs   |

## Create a case list

```shell
curl --location --request POST 'https://api.kayse.com/v1/case_lists' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "Mass Tort Prospects",
  "description": "Prospects that match tort filters",
  "filter": {
    "case_type_ids": [25],
    "status_ids": [30]
  },
  "include_ids": [101, 102],
  "exclude_ids": [],
  "is_obo": false
}'
```

### HTTP Request

`POST https://api.kayse.com/v1/case_lists`

### Request Body Fields

| Field        | Required | Type            | Description                                                                                     |
|--------------|----------|-----------------|-------------------------------------------------------------------------------------------------|
| name         | true     | String          | Case list name                                                                                  |
| description  | false    | String          | Optional description shown in the UI                                                            |
| filter       | false    | Object          | Case filter object using the same keys as `/v1/cases` (status_ids, case_type_ids, etc.)         |
| include_ids  | false    | Array<Integer>  | Explicit case IDs to include. Requires `filter` to be present                                   |
| exclude_ids  | false    | Array<Integer>  | Explicit case IDs to exclude. Requires `filter` to be present                                   |
| is_obo       | false    | Boolean         | When set, propagates the "on behalf of" flag to member cases via bulk update                    |

## Bulk upsert case lists

```shell
curl --location --request POST 'https://api.kayse.com/v1/case_lists/bulk' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
  "lists": [
    {
      "name": "PI Prospects",
      "description": "Personal injury prospects",
      "filter": { "case_type_ids": [10], "status_ids": [4] },
      "include_ids": [200, 250]
    },
    {
      "id": 55,
      "name": "Mass Tort Prospects",
      "is_obo": true,
      "filter": { "case_type_ids": [25] }
    }
  ]
}'
```

### HTTP Request

`POST https://api.kayse.com/v1/case_lists/bulk`

### Request Body Fields

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| lists | true | Array\<Object> | Array containing new or existing case list definitions. Omit `id` to create, provide `id` to update. |

Each object inside `lists` accepts the same fields as the create endpoint. When an `id` is provided the name/description/is_obo fields are updated and the filter is re-applied with the equivalent of a "set" action (existing members are replaced with the new filter result plus include/exclude overrides). Responses contain the resulting IDs and `action` ("created" or "updated").
