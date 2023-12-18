# Flutter Bloc - Clean Architecture

Flutter project using clean architecture and bloc pattern.

![Architecture](images/project_architecture.png?raw=true)

## Getting Started

### Requirements

- Dart: 3.2.0
- Flutter SDK: 3.16.0
- Melos: 3.1.0
- CocoaPods: 1.14.3

### Install

- WARN: If you already installed `melos`, you could omit this step.

- Install melos:
    - Run `dart pub global activate melos 3.1.0`

- Export paths:
    - Add to `.zshrc` or `.bashrc` file
```    
export PATH="$PATH:<path to flutter>/flutter/bin"
export PATH="$PATH:<path to flutter>/flutter/bin/cache/dart-sdk/bin"
export PATH="$PATH:~/.pub-cache/bin"
export PATH="$PATH:~/.gem/gems/lefthook-0.7.7/bin"
```
    - Save file `.zshrc`
    - Run `source ~/.zshrc`

### Config and run app

- cd to root folder of project
- Run `make gen_env`
- Run `make sync`
- Run & Enjoy!

### Build app

- cd to root folder of project
- Run `make clean` 
- Run `make gen_env`
- Run `make sync`
- Run `make <target-name>`

> Note: `<target-name>` is build_prod_apk or build_prod_ios. See more at file named `makefile`. Script details are in `tools` folder.

## Upgrade Flutter
- Update Flutter version in:
    - [README.md](#requirements)
    - [bitbucket-pipelines.yml](bitbucket-pipelines.yml)
    - [ci.yaml](.github/workflows/ci.yaml)
    - [cd_develop.yaml](.github/workflows/cd_develop.yaml)
    - [cd_qa.yaml](.github/workflows/cd_qa.yaml)
    - [cd_staging.yaml](.github/workflows/cd_staging.yaml)
    - [cd_production.yaml](.github/workflows/cd_production.yaml)

## Upgrade Melos
- Update Melos version in:
    - [README.md](#requirements)
    - [Install](#install)
    - [bitbucket-pipelines.yml](bitbucket-pipelines.yml)
    - [ci.yaml](.github/workflows/ci.yaml)
    - [cd_develop.yaml](.github/workflows/cd_develop.yaml)
    - [cd_qa.yaml](.github/workflows/cd_qa.yaml)
    - [cd_staging.yaml](.github/workflows/cd_staging.yaml)
    - [cd_production.yaml](.github/workflows/cd_production.yaml)

## License

MIT
