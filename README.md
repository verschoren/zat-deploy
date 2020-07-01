# zat-update

on: [push]

jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: ZAT Validate
    steps:
      # To use this repository's private action, you must check out the repository
      - uses: actions/checkout@v1
      - name: Checkout
        uses: verschoren/zat-validate@master
      - name: Zat validate
        uses: ./ # Uses an action in the root directory
        id: hello
        with:
          who-to-greet: 'Mona the Octocat'
          subdomain: ${{ secrets.ZAT_DOMAIN }}
          username: ${{ secrets.ZAT_USER }}
          password: ${{ secrets.ZAT_PASSWORD }}
          app-id: '246685'
