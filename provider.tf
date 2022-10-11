provider "aws"{
  region = "us-est-2"
   access_key = ${env.awsaccesskey}
   secret_key = &{env.awssecretkey}
}
