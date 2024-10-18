---
layout: default
title: Home
---
# Welcome to Hypha!

> **hypha**  hy·​pha
>
>(*noun*)
> :one of the threads that make up the mycelium of a fungus, increase by apical growth, and are transversely septate or nonseptate.

## Table of Contents

- [Getting Started](general/getting-started.html)
- [Deployment](deployment/deployment.html)
- [Contribution Guide](contribution/contribution-guide.html)
- [Repositories](repos/repos.html)

## About Hypha

Like hypha and mycelium, the different products that make up a 'stack' or a list of SKUs are a part of something larger. Hypha is a robust solution designed to help you track test results across a network of interconnected products and repositories. This platform provides users with the tools to create and manage products, establish integrations, and report tests.

### Future Plans and Ideas

1. **Introduce Upstream/Downstream Product Relations**
    - Implement an additional product relation type to identify upstream and downstream products. 
    - With sufficient data accumulation, there is potential to leverage AI to analyze test results from upstream projects, enabling predictions about potential issues downstream or enhancing the analysis of test results in the context of upstream findings.
2. **Introduce a "Product Stack" Relationship**
    - Implement a "product stack" relationship that groups products together, displaying results for the entire stack, including any integrations that exist between the products within that stack. This feature will facilitate a holistic view of testing outcomes across related products.
3. **Incorporate Product Version Filtering**
    - Allow users to define and filter by product version or build for each reported result, providing clearer context and tracking of changes over time.
4. **Develop a Query Language**
    - Introduce a user-friendly query language that avoids vulnerabilities like SQL injection. This feature could facilitate advanced querying of test results.
5. **Enable Jira Ticket Creation for Failed Tests**
    - Provide functionality for users to automatically create Jira tickets for any failed tests associated with a product or integration, streamlining issue tracking and resolution.
6. **Integrate Jira for Bug Snap-shotting**
    - Establish a connection to Jira, allowing users to view a snapshot of their bugs directly within the product interface, enhancing visibility and management of testing-related issues.

## Contact

If needed, contact the organization's administrators:

- [Caleb Evans](https://github.com/calebevans) (creator)

## License

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0) (the "License"); you may not use this organization’s repositories except in compliance with the License.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an **"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND**, either express or implied. See the License for the specific language governing permissions and limitations under the License.

