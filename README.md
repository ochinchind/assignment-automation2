# assignment-automation2

This repository contains Robot Framework tests for https://www.demoblaze.com/.

Run locally (requires Robot Framework and SeleniumLibrary):

1. Install dependencies (example):

	pip install robotframework robotframework-seleniumlibrary selenium

2. Run tests locally:

	robot -d results local testCases

Run on BrowserStack

1. Ensure `BROWSERSTACK_USERNAME` and `BROWSERSTACK_ACCESS_KEY` are available in the environment.
	You can put them in the provided `.env` file (already present) or configure them in your CI.

2. Make the run script executable and run it:

	chmod +x run_on_browserstack.sh
	./run_on_browserstack.sh

The script runs the suite three times (Chrome, Firefox, Safari) and writes results to `results/<browser>`.

CI (Jenkins)

The repository includes a `Jenkinsfile` that demonstrates running the three BrowserStack runs in stages.
Configure BrowserStack credentials in Jenkins as `BROWSERSTACK_USERNAME` and `BROWSERSTACK_ACCESS_KEY` and run the pipeline.

