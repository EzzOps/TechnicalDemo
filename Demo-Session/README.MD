# Pipeline Trigger Criteria

The Pipeline Trigger Criteria can be extracted from the provided information as follows:

```yaml
trigger:
  branches:
    include:
      - main
      - releases/*
    exclude:
      - releases/old*
  tags:
    include:
      - refs/tags/{tagname}
    exclude:
      - refs/tags/{othertagname}
```

Explanation

`Branch Trigger`

include: Defines branches that trigger the pipeline (e.g., changes to the 'main' branch or any branch under 'releases/').
exclude: Specifies branches to be excluded from triggering the pipeline (e.g., 'releases/old*').

`Tag Trigger`

include: Configures triggers based on tags, allowing the pipeline to be triggered by changes to specific tags (e.g., 'refs/tags/{tagname}').
exclude: Excludes specific tags from triggering the pipeline (e.g., 'refs/tags/{othertagname}').

`Default Trigger`

If no specific triggers are specified, the default behavior is to include all branches ('*'). This default behavior can be modified if the "Disable implied YAML CI trigger" setting is not enabled.

This YAML configuration provides a flexible way to define triggers based on branches and tags, allowing for precise control over when the pipeline should be triggered.


# Pipeline Trigger Criteria

The Pipeline Trigger Criteria can be extracted from the provided information as follows:

## Batching CI Runs

```yaml
trigger:
    batch: true
    branches:
        include:
            - main
Batching Configuration
batch: true: Enables batching of CI runs, where the system waits until the current run is completed before starting another run with accumulated changes.

Paths

trigger:
    branches:
        include:
            - main
            - releases/*
    paths:
        include:
            - docs
        exclude:
            - docs/README.md

Path Filters
paths: Specifies file paths to include or exclude during triggering.
include: Paths to include in the trigger (e.g., 'docs').
exclude: Paths to exclude from the trigger (e.g., 'docs/README.md').


Disabling CI Trigger

trigger: none: Stop CI triggers entirely, ensuring that pushing changes to a branch does not automatically start a CI run.

---
In the context of a CI/CD pipeline, a PR (Pull Request) trigger is a mechanism that initiates a build process when a pull request is created or updated. This is particularly useful for running automated tests and other checks on the code changes proposed in the pull request.

Here's an example of how you might set up a PR trigger in a YAML pipeline configuration:
pr:
    branches:
        include:
            - main
            - develop
In this example, the pipeline will be triggered whenever a pull request is created or updated that targets the main or develop branches.
pr:
    branches:
        exclude:
            - experimental/*
You can also exclude certain branches:
pr:
    branches:
        exclude:
            - experimental/*
In this case, the pipeline will not run for pull requests that target any branch in the experimental/ directory.

You can also include or exclude paths:
pr:
    paths:
        include:
            - src/*
        exclude:
            - docs/*
Here, the pipeline will only run if the pull request includes changes within the src/ directory, but not if the changes are only in the docs/ directory.

Remember, the exact syntax and capabilities of PR triggers can vary depending on the specific CI/CD system you're using. The examples above are based on Azure Pipelines.


