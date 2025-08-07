# Authentication

The Kayse API uses API keys to authenticate requests to its endpoints. You can generate new API keys in your company settings under the "API Keys" section.

## API Key Management

You can create multiple API keys, each with a custom name for easy identification. If you no longer need an API key, you can disable it through the dashboard without affecting your other keys.

## Including Your API Key

Include your API key in all requests to the Kayse API using the following method:

**Header Authentication:**
```
X-API-KEY: your_api_key_here
```

<aside class="success">Replace `your_api_key_here` with your actual API key.</aside>