# terraform 
cluster in a few clouds

## Digital ocean terraform demo
Basic terraform to create a kubernetes cluster in digital ocean with wordpres and a database (mysql)

### DO _provider
provider configuration and how to conect, the provider through a access token, the token is in the variable:
```tf
variable "digitalocean_token" {}
```

the value can be stored through an enviroment variable in the bash shell withe the following command:
```
export TF_VAR_digitalocean_token=access_token
```