# Unity Package Template

Template repository for custom Unity package development.

## Overview
- The default project location is `./Project`.
- The default package location is `./Project/Assets/Standard Assets/Package`.
- A preamble file is included at `./preamble.txt`. The text in this file will be prepended to all source code files prior to deployment.

## Quick Start
1. Click "Use this template" (above).
2. Follow the generate repository screen.
	- OPTIONAL: check "Include all branches" to include the recommended branching workflow.
3. Clone the project to your workstation.
4. Open the file `./Project/Assets/Standard Assets/Package/package.json`. Replace the placeholder values with your package's details.
5. Rename the project folder to your package's name.
6. Rename the package folder to your package's name.
7. Edit the text in `./preamble.txt`.

### Azure DevOps
1. Create a new pipeline in Azure Pipelines.
3. Set the pipeline to run when `master` changes.
2. Create a pipeline variable named `Custom.PackageRoot`. The value should be the relative path to your package. (Ex. `Project/Assets/Standard Assets/Package`)

Merge changes into `master`. This will trigger the pipeline. The UPM package will be published back into your repository on a branch named `upm`. Access your package in the Unity Package Manager via the HTTP repository URL followed by `#upm`.
