resource "vercel_project" "algo" {
  name      = "algo"
  framework = "nextjs"

  git_repository = {
    type = "github"
    repo = "vineelsai26/Algo"
  }
}

resource "vercel_project" "collab" {
  name      = "collab"
  framework = "vite"

  git_repository = {
    type = "github"
    repo = "vineelsai26/Collab"
  }
}
