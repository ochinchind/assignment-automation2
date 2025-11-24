#!/bin/bash

# Set BrowserStack credentials

# Run tests on all browsers
export BROWSERSTACK="True"

echo "Running tests on BrowserStack..."

# Run all tests
robot --outputdir results testCases/test_browserstack.robot

# Or run specific browser tests using tags:
# robot --outputdir results --include chrome testCases/test_browserstack.robot
# robot --outputdir results --include safari testCases/test_browserstack.robot
# robot --outputdir results --include edge testCases/test_browserstack.robot

echo "Tests completed. Check results folder for reports."