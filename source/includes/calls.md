# Calls

## Schedule New AI Call

```shell
curl --location --request POST 'https://public-api.kayse.ai/v1/calls' \
--header 'accept: application/json' \
--header 'X-Public-Api-Key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
    'campaign_id': 123,
    'case_id': 123
}'
```

### HTTP Request

`POST https://public-api.kayse.ai/v1/calls`

> The above command returns JSON structured like this:

```json
{
  "campaign_id": 123,
  "client_id": 123,
  "case_id": 123
}
```

### Request Body Fields

| Field       | Required | Type    | Description                                               |
|-------------|----------|---------|-----------------------------------------------------------|
| campaign_id | true     | Integer | Unique campaign identifier                                |
| case_id     | true     | String  | Source system identifier (a static list defined in-app)   |