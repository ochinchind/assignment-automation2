
set -euo pipefail
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

mkdir -p results/chrome results/firefox results/safari

for B in "Chrome" "Firefox" "Safari"; do
  echo "\n=== Running tests on BrowserStack: $B ==="
  export BROWSER="$B"
  export BROWSERSTACK="True"

  ROBOT_OUTPUT_DIR="results/$(echo $B | tr '[:upper:]' '[:lower:]')"
  mkdir -p "$ROBOT_OUTPUT_DIR"
\
  robot -d "$ROBOT_OUTPUT_DIR" testCases
  echo "Finished run for $B (results in $ROBOT_OUTPUT_DIR)"
done

echo "All BrowserStack runs finished."
