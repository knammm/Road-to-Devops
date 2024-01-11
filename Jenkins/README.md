# Continuous Integration with Jenkins

## What is Continuous Integration (CI)?

Continuous Integration is a software development practice where developers integrate their code changes into a central repository frequently. The typical CI workflow involves the following steps:

1. **Code:** Developers write code.
2. **Build:** Code is compiled and built.
3. **Test:** Automated tests are run to ensure code quality.
4. **Push:** Code changes are pushed to a version control system (VCS).

### Problems

- Merge but not Integrated: Leads to many bugs and conflicts.

### Solution

- Implement Continuous Integration: Automatically fetch, build, and test code upon each merge into the main branch.

## Continuous Integration Process

1. Developer codes.
2. Push code to Version Control System (VCS).
3. Jenkins fetches, builds, and tests the code.
4. Notification is sent to the developer.
   - If the code fails, the developer must fix it.

## Jenkins Features

- **Open Source**
- **Extensible:** Supports plugins for various functionalities (VCS, Build, Cloud, Testing, etc...)

### Jenkins Server IP

Public IP of the EC2 instance running Jenkins.

## Jobs in Jenkins

### Freestyle

- Graphical jobs with an output.
- Recommended for learning, understanding, and exploring Jenkins.
- Not recommended in real-time scenarios.

### Pipeline as a Code

- Pipeline created using Groovy.
- Recommended in modern CI/CD practices.

## Pipeline as a Code

- Automates pipeline setup with a Jenkinsfile.
- Jenkinsfile defines stages in the CI/CD pipeline.
- Uses its own specific DSL (Domain Specific Language) similar to Groovy.
- Two syntax options: Scripted and Declarative.

## Pipeline Concepts

- **Pipeline:** Main block for executing everything in Jenkins.
- **Node/Agent:** Specifies where the pipeline can be executed.
- **Stage:** Defines where the execution happens.
- **Step:** Commands within a stage (e.g., git pull, upload artifact).

## Using Environment Variables

Jenkins Pipeline exposes environment variables via the global variable `env`. Key variables include:

1. **BUILD_ID:** Current build ID.
2. **BUILD_NUMBER:** Current build number.
3. **BUILD_TAG:** String identifier for the build.
4. **BUILD_URL:** URL where build results can be found.
5. **EXECUTOR_NUMBER:** Unique number identifying the current executor.
6. **JAVA_HOME:** Path to the JDK if configured for the job.
7. **JENKINS_URL:** Full URL of Jenkins.
8. **JOB_NAME:** Name of the project.
9. **NODE_NAME:** Name of the node the build is running on.
10. **WORKSPACE:** Absolute path of the workspace.

For more details on available environment variables, refer to the [Jenkins Pipeline documentation](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/#built-in-environment-variables).