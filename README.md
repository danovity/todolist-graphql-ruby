# README

TODOLIST GraphQL API using Ruby on Rails, https://todolistapp.seanye.dev/graphql

## How To Access

Please use your preferred GraphQL Ide to access the endpoint, https://todolistapp.seanye.dev/graphql

- Step 1, Register User using the `registerUser` mutation
- Step 2, Sign in User using the `signInUser` mutation with the registered user's credentials, make sure you ask for the `token` in the response

```
# Sample Mutation (SignInUser)
mutation signInUser($input: SignInUserInput!){
  signinUser(input: $input){
    token
    user{
      id
      name
      email
    }
  }
}

{
  "input":{
    "credentials":{
      "email": "user@gmail.com",
      "password": "123456"
    }
  }
}

# Sample Response
{
  "data": {
    "signinUser": {
      "token": "LTUaLtVLNLso4dNSV1X5scLX--IucaMiTMO+J1Nk1O--+ljixIvKYCVYYX14r0Z1hA==",
      "user": {
        "id": "1",
        "name": "Sean",
        "email": "user@gmail.com"
      }
    }
  }
}
```
- Step 3, Copy the token, and add a field called `token` to `Headers`, lastly copy the token value to that field.
- Step 4, You should now be able to create, read, update, and delete the tasks/subtasks
