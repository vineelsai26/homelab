resource "vercel_project_environment_variable" "collab_vite_backend_url" {
  project_id = vercel_project.collab.id
  key        = "VITE_BACKEND_URL"
  value      = "https://api-collab.vineelsai.com"
  target     = ["production", "preview", "development"]
}

resource "vercel_project_environment_variable" "collab_vite_google_client_id" {
  project_id = vercel_project.collab.id
  key        = "VITE_GOOGLE_CLIENT_ID"
  value      = "1079705324063-bf6i4hi0iimc4nmvsge2rc8s4iuc5sik.apps.googleusercontent.com"
  target     = ["production", "preview", "development"]
}

resource "vercel_project_environment_variable" "collab_vite_url" {
  project_id = vercel_project.collab.id
  key        = "VITE_URL"
  value      = "https://collab.vineelsai.dev"
  target     = ["production", "preview", "development"]
}
