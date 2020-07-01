# zat-update

## Flow

This Action updates an existing app in your Zendesk instance.
It requires a *.zat* file in the root of your repository.

The *.zat* file should contain the following:

    {
      "zat_latest": "3.8.0",
      "zat_update_check": "2020-07-01",
      "subdomain": "subdomaain",
      "username": "admin@example.com/token",
      "password": "your_api_token",
      "app_id": 123456
    }
  
Make sure to replace the *app_id* with the ID of the currently installed app.

## Dependencies
1. The action uses docker pull verschoren/zendesk_zat:latest
2. It then uses the entrypoint.sh to run *zat update*
