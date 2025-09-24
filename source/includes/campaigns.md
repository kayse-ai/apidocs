# Campaigns

## Create Campaign

```shell
curl --location --request POST 'https://public-api.kayse.ai/v1/calls' \
--header 'accept: application/json' \
--header 'X-Public-Api-Key: {{apikey}}' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Test",
    "agent_id": "abc_123123",
    "case_list_id": 123,
    "start_time": "2006-01-02T15:04:05Z07:00",
    "end_time": "2006-01-02T15:04:05Z07:00", 

    "callback_delays": [
        {
            "minutes": 1,
            "hours": 0,
            "days": 0
        }
    ],
    "days": ["Monday", "Tuesday"],

    "send_sms_before_call_delay_minutes": 15,
    "send_sms_before_call": true,
    "sms_before_call_text": "test test",
    "send_sms_after_successful_call": true,
    "sms_after_successful_call_text": "test test",
    "send_sms_after_failed_call": true,
    "sms_after_failed_call_text": "test test",

    "is_obo": false,

    "calls_scheduled_externally": true, 
}'
```

### HTTP Request

`POST https://api.kayse.com/v1/campaigns`

> The above command returns JSON structured like this:

```json
{
    "name": "Test",
    "agent_id": "abc_123123",
    "case_list_id": 123,
    "case_list_name": "test test test",
    "start_time": "2006-01-02T15:04:05Z07:00",
    "end_time": "2006-01-02T15:04:05Z07:00", 
    "agent": {
        "id": 123,
        "name": "karen",
        "voice_id": "abc_123",
        "avatar_url": "https://host.com/img.png",
    },

    "stats": {
        "call_id_123": {
            "total_calls": 132,
            "finished_calls": 120,
            "called_clients": 95,
            "total_clients": 100,
            "success_calls": 85,
            "success_calls_percentage": 70.8,
            "failed_calls": 35,
            "failed_calls_percentage": 29.2,
            "average_sentiment_score": 0.76,
            "average_call_duration": "04:35",
            "total_call_duration": "12:20",
            "disqualified_clients": 5,
            "disqualification_rate": 5.0,
            "converted_clients": 40,
            "conversion_rate": 42.1,
            "in_progress_rate": 12.5
        }
    },

    "callback_delays": [
        {
            "minutes": 1,
            "hours": 0,
            "days": 0
        }
    ],
    "days": ["Monday", "Tuesday"],

    "send_sms_before_call_delay_minutes": 15,
    "send_sms_before_call": true,
    "sms_before_call_text": "test test",
    "send_sms_after_successful_call": true,
    "sms_after_successful_call_text": "test test",
    "send_sms_after_failed_call": true,
    "sms_after_failed_call_text": "test test",

    "is_obo": false,

    "calls_scheduled_externally": true, 
}
```

### Request Body Fields

| Field                              | Required | Type     | Description                                               |
|------------------------------------|----------|----------|-----------------------------------------------------------|
| name                               | true     | String   | Campaign name                                             |
| agent_id                           | true     | String   | ID of AI agent that's being used by the campaign          |
| case_list_id                       | true     | String   | ID of cases that this campaigns operates on               |
| start_time                         | false    | Object   | Time of day to start the campaign execution               |
| end_time                           | false    | String   | Time of day to end the campaign execution                 |
| callback_delays                    | false    | []Object | Delays used to retry calls on failure                     |
| days                               | false    | String   | Weekdays on which campaign should be executed             |
| send_sms_before_call_delay_minutes | false    | String   | Number of minutes to send sms before call                 |
| send_sms_before_call               | true     | String   | Whether to send sms before call                           |
| sms_before_call_text               | true     | String   | Sms before call message text                              |
| send_sms_after_successful_call     | false    | Boolean  | Whether to send sms after successful call                 |
| sms_after_successful_call_text     | false    | Date     | Sms after successful call message text                    |
| send_sms_after_failed_call         | false    | Date     | Whether to send sms after failed call                     |
| sms_after_failed_call_text         | false    | Date     | Sms after failed call message text                        |
| is_obo                             | false    | Boolean  | Identifies whether campaign is based on obo clients       |
| calls_scheduled_externally         | false    | Boolean  | identifies whether calls are scheduled from outside Kayse |


## List Campaigns

```shell
curl --location --request GET 'https://public-api.kayse.ai/v1/calls' \
--header 'accept: application/json' \
--header 'X-Public-Api-Key: {{apikey}}' \
--header 'Content-Type: application/json'
```

### Query Params

| Field                              | Required | Type     | Description                                               |
|------------------------------------|----------|----------|-----------------------------------------------------------|
| key                                | false    | String   | Used for search purposes                                  |


### HTTP Request

`GET https://api.kayse.com/v1/campaigns`

> The above command returns JSON structured like this:

```json
[
    {
        "name": "Test",
        "agent_id": "abc_123123",
        "case_list_id": 123,
        "case_list_name": "test test test",
        "start_time": "2006-01-02T15:04:05Z07:00",
        "end_time": "2006-01-02T15:04:05Z07:00", 
        "agent": {
            "id": 123,
            "name": "karen",
            "voice_id": "abc_123",
            "avatar_url": "https://host.com/img.png",
        },

        "stats": {
            "call_id_123": {
                "total_calls": 132,
                "finished_calls": 120,
                "called_clients": 95,
                "total_clients": 100,
                "success_calls": 85,
                "success_calls_percentage": 70.8,
                "failed_calls": 35,
                "failed_calls_percentage": 29.2,
                "average_sentiment_score": 0.76,
                "average_call_duration": "04:35",
                "total_call_duration": "12:20",
                "disqualified_clients": 5,
                "disqualification_rate": 5.0,
                "converted_clients": 40,
                "conversion_rate": 42.1,
                "in_progress_rate": 12.5
            }
        },

        "callback_delays": [
            {
                "minutes": 1,
                "hours": 0,
                "days": 0
            }
        ],
        "days": ["Monday", "Tuesday"],

        "send_sms_before_call_delay_minutes": 15,
        "send_sms_before_call": true,
        "sms_before_call_text": "test test",
        "send_sms_after_successful_call": true,
        "sms_after_successful_call_text": "test test",
        "send_sms_after_failed_call": true,
        "sms_after_failed_call_text": "test test",

        "is_obo": false,

        "calls_scheduled_externally": true, 
    }
] 
```