# .\start_docker.ps1

# 1. Clear the screen for a fresh start
Clear-Host

Write-Output "🚀 Launching Book Collection Dev Environment..."

# 2. Run the Docker container
# - --rm: Deletes the container when you exit (keeps things clean)
# - -it: Interactive mode (so you can type)
# - -p 3000:3000: Opens the port so you can see the website in your browser
# - --mount: Connects your current Windows folder to /work inside Docker
docker run --rm -it `
  -p 3000:3000 `
  --entrypoint /bin/bash `
  --mount "type=bind,source=${PWD},target=/work" `
  -w /work `
  paulinewade/csce431:sp26v1

Write-Output "❌ Docker session ended."