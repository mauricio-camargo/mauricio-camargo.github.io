#Não pode salvar o Token aqui, senão o Github 
#não deixa fazer Push.

usethis::use_git_config(
  user.name = "mauricio-camargo",
  user.email = "camargofurg@gmail.com")

usethis::create_github_token()

gitcreds::gitcreds_set()
