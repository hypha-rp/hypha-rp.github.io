---
layout: default
title: Demo
---

# Demo

Follow the instructions below to deploy and interact with the demo environment.

## Prerequisites

1. Install [Docker](https://docs.docker.com/engine/install/) or [Podman](https://podman.io/docs/installation).
2. Install [docker-compose](https://docs.docker.com/compose/install/) or [podman-compose](https://github.com/containers/podman-compose?tab=readme-ov-file#installation).
3. Clone the [dev-tools](https://github.com/hypha-rp/dev-tools) repo to your local machine.
   ```bash
   git clone git@github.com:hypha-rp/dev-tools.git
   ```

## Deploy Local Demo Environment

1. In your terminal, make sure you are in the `dev-tools` directory.
   ```bash
   cd dev-tools
   ```
2. Build the demo environment.
   ```
   make demo
   ```
3. Visit [http://localhost:8080](http://localhost:8080) to interact with your new demo environment!

## Basic Usage

Below are some basic instructions for interacting with the environment as a user.

### Create a Product

1. On the ["Products" page](http://localhost:8080/products), click the "+" button located in the bottom right corner.
2. Populate the required fields.
   - "Full Name" - The actual name of the product (*e.g.* `Kubernetes`).
   - "Short Name" - The acronym/abbreviation of the product (*e.g.* `K8s`).
   - "Contact Email" - An email address used to contact a person(s) of authority on the product (*e.g.* `k8s@email.com`).
3. Click the "Save" button to finish creating the product.

### Create an Integration

1. From the ["Products" page](http://localhost:8080/products), navigate to one of the products by clicking on it.
2. Navigate to the "Integrations" tab, and click the "+" button located in the bottom right corner.
3. In the new dialog, search for the product you'd like to integration this product with (you can search for the full or short name).
4. Select the correct product from the results, and click the "Confirm" button.
5. You should now see an integration populated on the "Integrations" tab of that product. If you navigate to the other product, you will notice it there as well.

### Configure an Integration

In Hypha, the results that are shown for an integration are determined by a set of rules. Use these steps to create some rules for an integration.

1. While you are in an integration, navigate to the "Rules" tab and click the "+" button located in the bottom right corner.
2. Determine the expression you would like to use to filter (test suite or case names) test results for this integration.
   - The expression can be an exact match like `some-specific-test-suite` or it can use wildcards like `test-starts-with-*`.
   - To find the results, hypha searches for results being reported by either product in the integration where the test case/suite name(s) match the expression provided.
   - **Example:** if you would like to use the [JUnit example](#junit-example) found below, use the expression `integration*` and apply it to test cases.
3. Select which result object(s) you would like the expression to apply to.
4. Click the "Save" button to finish creating the rule.

### Report Test Results

**Note:** Either download the example outlined in the [JUnit Example](#junit-example) section, or acquire/create a different one ot test with.

1. Navigate to the product you'd like to report the results to (if you are using the integration functionality, 
   use one of the products in the integration).
2. Find the `ID` of the product (it is shown on multiple pages) and click the copy button next to it.
3. Open a terminal and use the following `curl` command to report results. Don't forget to replace the path and product ID values.
   ```bash
   curl -X POST http://localhost:8081/results/ \
        -F "productId=<product-uuid-value>" \
        -F "file=@<path/to/your/results.xml>"
   ```
4. View the results! Navigate to the product you reported the results to and explore the results. If you used and integration with rules that match
   the results you used, check the filtered results for the integration. 

### JUnit Example

Below is an example of a JUnit results file. It can be downloaded and used in the demo, 
but you can also use any file you'd like to test with (data is stored locally on your computer in a container and is NOT shared in anyway).

<a href="demo_junit.xml" download>Download Example</a>
```xml
<?xml version="1.0" encoding="UTF-8"?>
<testsuites name="Test run" tests="8" failures="1" errors="1" skipped="1" 
    assertions="20" time="16.082687" timestamp="2021-04-02T15:48:23">
    <testsuite name="Tests.Registration" tests="8" failures="1" errors="1" skipped="1" 
        assertions="20" time="16.082687" timestamp="2021-04-02T15:48:23" 
        file="tests/registration.code">
        <properties>
            <property name="version" value="1.774" />
            <property name="commit" value="ef7bebf" />
            <property name="browser" value="Google Chrome" />
            <property name="ci" value="https://github.com/actions/runs/1234" />
            <property name="config">
                Config line #1
                Config line #2
                Config line #3
            </property>
        </properties>
        <system-out>Data written to standard out.</system-out>
        <system-err>Data written to standard error.</system-err>
        <testcase name="testCase1" classname="Tests.Registration" assertions="2"
            time="2.436" file="tests/registration.code" line="24" />
        <testcase name="testCase2" classname="Tests.Registration" assertions="6"
            time="1.534" file="tests/registration.code" line="62" />
        <testcase name="testCase3" classname="Tests.Registration" assertions="3"
            time="0.822" file="tests/registration.code" line="102" />
        <testcase name="testCase4" classname="Tests.Registration" assertions="0"
            time="0" file="tests/registration.code" line="164">
            <skipped message="Test was skipped." />
        </testcase>
        <testcase name="integrationTestCase5" classname="Tests.Registration" assertions="2"
            time="2.902412" file="tests/registration.code" line="202">
            <failure message="Expected value did not match." type="AssertionError"></failure>
        </testcase>
        <testcase name="integrationTestCase5" classname="Tests.Registration" assertions="0"
            time="3.819" file="tests/registration.code" line="235">
            <error message="Division by zero." type="ArithmeticError"></error>
        </testcase>
        <testcase name="integrationTestCase5" classname="Tests.Registration" assertions="3"
            time="2.944" file="tests/registration.code" line="287">
            <system-out>Data written to standard out.</system-out>
            <system-err>Data written to standard error.</system-err>
        </testcase>
        <testcase name="integrationTestCase5" classname="Tests.Registration" assertions="4"
            time="1.625275" file="tests/registration.code" line="302">
            <properties>
                <property name="priority" value="high" />
                <property name="language" value="english" />
                <property name="author" value="Adrian" />
                <property name="attachment" value="screenshots/dashboard.png" />
                <property name="attachment" value="screenshots/users.png" />
                <property name="description">
                    This text describes the purpose of this test case and provides
                    an overview of what the test does and how it works.
                </property>
            </properties>
        </testcase>
    </testsuite>
</testsuites>
```

## Cleanup

To cleanup your demo environment run the following in the `dev-tools` directory: 

```bash
make demo-down
```