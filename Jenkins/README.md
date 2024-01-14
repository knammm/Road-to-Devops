# Continuous Integration with Jenkins

Continuous Integration (CI) is a software development practice where developers frequently integrate their code changes into a central repository. The CI workflow typically involves coding, building, testing, and pushing code changes to a version control system (VCS).

## Problems

- Merging without integration leads to bugs and conflicts.

## Solution

Implement Continuous Integration: Automatically fetch, build, and test code upon each merge into the main branch.

## Continuous Integration Process

1. Developers code.
2. Push code to the Version Control System (VCS).
3. Jenkins fetches, builds, and tests the code.
4. A notification is sent to the developer.
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

## Simple Pipeline

1. **Fetch Code**
2. **Build**
3. **Unit Test**
4. **Code Analysis**
5. **Upload Artifact**

## Why Code Analysis?

Code Analysis involves detecting functionality and vulnerability errors, following best practices, checking for vulnerabilities, identifying functional errors before deployment, and using tools such as Checkstyle, Cobertura, mstest, OWASP, SonarQube Scanner, etc.

SonarQube sends information to Jenkins via Webhooks.

## Software Repositories

- Maven: Maven dependencies
- apt: Packages for Debian-based systems
- yum: Packages for RedHat-based systems
- NuGet: Package manager for .NET
- Npm: Package manager for JavaScript
- Docker: Registry to store Docker Images

# Nexus Software Repository Manager

**Key Points:**

- Runs on Java.
- Used to store artifacts.
- Serves as a package manager for dependencies.
- Available in Open Source & Enterprise Versions.
- Supports a variety of repositories like Maven, apt, Docker, Ruby, etc.

**Note:**
- Store artifacts => hosted. Download dependencies => proxy. Group is for both.

**Slack Token:** `sSYnjpbOuYcGkMiv9NFJTiLz`

To integrate with Slack, the Jenkins workspace URL should follow the format `http://<workspace>.slack.com`. Ensure the full workspace URL is used, as Jenkins expects it in the format `http://<workspace>.slack.com`. For example, if your workspace URL is `cicd-7cz33...com`, use this complete URL for successful testing.

For more information, visit [Slack](https://slack.com/intl/en-in/workspace-signin).

## Container Hosting Platforms

- **Docker Engine:**
  - For testing and local environments.
  - Does not provide high availability, self-healing, etc.

- **Kubernetes:**
  - For production.
  - Includes standalone, EKS (AWS), AKS (Azure), GKS (Google), Openshift (Redhat), etc.
  - For now, we can use ECS: We will run our container application here.

## Jenkins Build Trigger

**GitHub Webhook:**
1. Create a repository with the Jenkinsfile.
2. Connect Jenkins job (Pipeline) with the repository through SSH.
3. Add a webhook in the repository (Include the IP with /github-webhook/).
4. Update the Build Trigger option in the Jenkins job.

**Poll SCM:**
- Jenkins will regularly check for any GitHub commit (reverse to the above).
- The format is the same as a Cron job in Linux.

**Scheduled Jobs:**
- Almost the same as Poll SCM, but it does not check the repository like Poll SCM.
- Similar to a Cron job in bash scripting.

**Remote Triggers:**
- You can trigger the job anywhere as long as you have network access to the Jenkins server.

## Jenkins Master-Slave
### Use cases: Use For Distributed Builds, Cross Platform builds and much more.

- Load Distribution: Jenkins Master executes Build job on the Node it selected.
- Cross Platform Build: Executing Build of other platforms like .NET (Windows), IOS (MacOS) from Jenkins Master (Linux)
- Software Testing: Execute Testers Test automation scripts from Node.

### Prerequisites for Node Setup:

- Any OS
- Network access from Master (make sure to check the firewall rules)
- Java, JRE, JDK
- User
- Directory with User ownership
- Tools are required by the Jenkins job

## Jenkins Security

1. User login: Jenkins own database, Sign Up, LDAP Integration
2. Permissions on Jenkins: Admin, Read, Jobs, Credentials, Plugins, etc...
3. Permissions on Jobs: View, Build, Delete, Configure, etc...

**Note:** A very popular plugin for Adding Roles: `Role-based Authorization Strategy`
