name: terraform-testing
on:
  repository_dispatch:
    types:
      - terraform-testing

jobs:
  setup:
    name: setup
    runs-on: ubuntu-latest

    - name: Checkout
      uses: actions/checkout@v2

    - name: initialize terraform en
      uses: hashicorp/setup-terrafo
      with:
        terraform_version: ~0.14.3

    - name: output terraform version
      run: terraform version

    - name: terraform init
      run: |
        cd ./terraform
        terraform init

    - name: terraform plan
      run: |
      cd ./terraform
      terraform plan 

    - name: terraform apply
      run: |
      cd ./terraform
      terraform plan --auto-approve