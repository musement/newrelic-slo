# Quality assurance New Relic SLO

This project is a containerized version of [TestCafe](https://devexpress.github.io/testcafe/documentation/test-api/test-code-structure.html) web-based functional testing framework. It allows 


## Getting Started

These instructions will allow you to set the project up and running on your local machine for development and testing purposes.

### Prerequisites

- docker
- docker-compose
- GNU make

For Linux users
```shell
sudo apt-get install build-essential
```

For Mac users
You can get make with the latest version of Xcode (with [Make](https://www.gnu.org/software/make/manual/make.html)), available from Apple's [Mac Dev Center](http://developer.apple.com/mac/).

- Docker
If you will follow the set-up with Docker (see below) then install last [Docker](https://www.docker.com/community-edition) for your specific OS.

### Installing

#### Docker


__Note__:
before being able to run NR1 you will need to set the New Relic API Key in both:
- .env
- devcontainer.env

There are 2 ways to install the current project

- with Visual Studio Code

From the root of the project launch
```shell
cd <YOUR_PROJECT_ROOT_DIRECTORY>
code .
```

It should automatically propose you to build and run the project into a container.
If not just follow the steps indicated on Microsoft's [offical documentation](https://code.visualstudio.com/docs/remote/containers).

Then open the terminal of the container and run
```shell
cd <YOUR_PROJECT_ROOT_DIRECTORY>
make prepare
```

- without Visual Studio Code

From the root of the project
```shell
cd <YOUR_PROJECT_ROOT_DIRECTORY>
cd .devcontainer
docker-compose up -d --build --force-recreate
make prepare
```

- commands

You can create a new package by giving a name as an environment variable
```shell
cd <YOUR_PROJECT_ROOT_DIRECTORY>
PROJECT_NAME=my-awesome-nerdpack make create
```

Then you can try it by running the serve command (remembering to declare it as an environment variable)
```shell
cd <YOUR_PROJECT_ROOT_DIRECTORY>
 PROJECT_NAME=my-awesome-nerdpack make run
docker exec -it qa-newrelic-slo bash -c 'cd my-awesome-nerdpack && nr1 nerdpack:serve'
Found and loaded 2 nr1.json files on MyAwesomeNerdpack (170f3d36-b183-49a5-a34a-9d92fa9b08e1) Nerdpack.

Nerdpack:
 ✔  MyAwesomeNerdpack (170f3d36-b183-49a5-a34a-9d92fa9b08e1) nr1.json

Launchers:
 ✔  my-awesome-nerdpack-launcher launchers/my-awesome-nerdpack-launcher/nr1.json

Nerdlets:
 ✔  my-awesome-nerdpack-nerdlet nerdlets/my-awesome-nerdpack-nerdlet/nr1.json

There is no certificate created yet.
 ✔  New certificate created.

🛠  Built artifact files for:
 ⁎  170f3d36-b183-49a5-a34a-9d92fa9b08e1--my-awesome-nerdpack-nerdlet built ✔

 ✔  Nerdpack built successfully!
 ★  Starting as orchestrator...

 ✔  Server ready! Test it at: https://one.eu.newrelic.com/?nerdpacks=local
 ↩  Server will reload automatically if you modify any file!

🛠  Built artifact files for:
 ⁎  170f3d36-b183-49a5-a34a-9d92fa9b08e1--my-awesome-nerdpack-nerdlet built ✔

 ✔  Nerdpack built successfully!
```

At this point you just need to open [that](https://one.eu.newrelic.com/?nerdpacks=local) URL 
from your browser being sure to be logged in and 

If needed you can remove the project
```shell
cd <YOUR_PROJECT_ROOT_DIRECTORY>
PROJECT_NAME=my-awesome-nerdpack make remove
```




### Distro
the distribution installed on the remote container is a [Debian 9](https://www.debian.org/releases/stretch/index.en.html) based.


## Conventions

### Git commit message convention

The project follows [this Git commit message convention](https://musement.atlassian.net/wiki/spaces/TEC/pages/932872196/Write+a+Git+commit+message).

#### Format:

`<jira-ticket> | <type>(<scope>): <subject>`

| Type | Description |
|------| ----------- |
| `style` | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc) |
| `chore` | Changes to the build process or auxiliary tools and libraries such as documentation generation |
| `docs` | Documentation Updates |
| `feat` | New Features |
| `fix`  | Bug Fixes |
| `refactor` | Code Refactoring |
| `test` | Adding missing tests |
| `perf` | A code change that improves performance |


## Useful links
https://github.com/newrelic/nr1-slo-r

https://discuss.newrelic.com/t/track-your-service-level-objectives-with-the-slo-r-nerdpack/90046