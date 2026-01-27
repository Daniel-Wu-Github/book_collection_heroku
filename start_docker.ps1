# .\start_docker.ps1

# 1. Clear the screen for a fresh start
Clear-Host

Write-Output "🚀 Launching Book Collection Dev Environment..."

# 2. Run the Docker container
# - --rm: Deletes the container when you exit (keeps things clean)
# - -it: Interactive mode (so you can type)
# - -p HOST:3000: Opens the host port so you can see the website in your browser
# - --mount: Connects your current Windows folder to /work inside Docker

# Try up to 10 host ports (3000..3009). If one fails, try the next.
for ($i = 0; $i -lt 10; $i++) {
  $hostPort = 3000 + $i
  Write-Output "🚀 Attempting to launch container on host port $hostPort..."

  & docker run --rm -it -p "$hostPort`:3000" --entrypoint /bin/bash --mount "type=bind,source=${PWD},target=/work" -w /work paulinewade/csce431:sp26v1
  $exitCode = $LASTEXITCODE

  if ($exitCode -eq 0) {
    Write-Output "✅ Docker session ended (container ran and exited cleanly)."
    break
  }

  Write-Output "⚠️ Attempt on port $hostPort failed (exit code $exitCode)."
  if ($i -lt 9) {
    Write-Output "Trying next port..."
  } else {
    Write-Output "❌ All ports 3000..3009 failed. Please free a port or try again with a different range."
  }
}