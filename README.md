# Unity Package Template

Template repository for custom Unity package development.

## Overview
- The default project location is `./Project`.
- The default package location is `./Project/Assets/Standard Assets/Package`.
- A preamble file is included at `./preamble.txt`.
	- The text in this file will be prepended to all source code files prior to deployment.

## Quick Start
1. Click "Use this template" (above).
2. Follow the generate repository screen.
	- OPTIONAL: check "Include all branches" to include the recommended branching workflow.
3. Clone the project to your workstation.
4. Edit the file `./README.md` with your package's details.
5. Edit the file `./Project/Assets/Standard Assets/Package/package.json` with your package's details.
6. Edit the file `./Project/Assets/Standard Assets/Package/README.md` with your package's details.
7. Edit the header text in `./preamble.txt`.
8. Rename the project folder to your package's name.
9. Rename the package folder to your package's name.

### Azure DevOps
1. Create a new pipeline in Azure Pipelines.
2. Create a pipeline variable named `Custom.PackageRoot`.
	- The value should be the relative path to your package. (Ex. `Project/Assets/Standard Assets/Package`)
