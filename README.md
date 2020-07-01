# zat-update

on: [push]

jobs:
  zat_update:
    runs-on: ubuntu-latest
    name: ZAT UPDATE
    steps:
      # To use this repository's private action, you must check out the repository
      - uses: actions/checkout@v1
      - name: Checkout
        uses: verschoren/zat-validate@master
      - name: Zat Validate
        uses: ./ # Uses an action in the root directory
        with:
          subdomain: ${{ secrets.ZAT_DOMAIN }}
          username: ${{ secrets.ZAT_USER }}
          password: ${{ secrets.ZAT_PASSWORD }}
          app-id: '246685'
