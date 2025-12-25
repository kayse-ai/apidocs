# Metadata

The metadata endpoint exposes a machine-readable list of public objects (cases, clients, case lists) along with their fields, data types, and whether they are required. This is useful for building dynamic integrations that need to adapt to new fields as they become available.

## List objects and fields

```shell
curl --location --request GET 'https://api.kayse.com/v1/metadata/objects' \
--header 'accept: application/json' \
--header 'x-api-key: {{apikey}}'
```

### HTTP Request

`GET https://api.kayse.com/v1/metadata/objects`

> The above command returns JSON structured like this:

```json
[
  {
    "name": "cases",
    "fields": [
      {
        "name": "case_number",
        "type": "string",
        "required": false,
        "description": "Unique case identifier"
      },
      {
        "name": "status",
        "type": "string",
        "required": true,
        "description": "Case status (created if missing)"
      }
    ]
  },
  {
    "name": "clients",
    "fields": [
      {
        "name": "email",
        "type": "string",
        "required": false,
        "description": "Primary email"
      }
    ]
  }
]
```

### Response Fields

| Field       | Type            | Description                                               |
|-------------|-----------------|-----------------------------------------------------------|
| name        | String          | Object name (e.g., `cases`, `clients`, `case_lists`)      |
| fields      | Array\<Field>   | List of fields belonging to the object                    |
| fields[].name | String        | Field name as accepted by the API                        |
| fields[].type | String        | Data type (`string`, `uint`, `bool`, `date`, `object`, etc.) |
| fields[].required | Boolean   | Indicates whether the field is required on create        |
| fields[].description | String | Human-friendly description of the field                  |

The endpoint is cached and changes whenever new public fields are added so integrations can refresh their local schema instead of tracking changes manually.
