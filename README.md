# docker-terraform-utils
A docker image that contains tools used to build and deploy Terraform modules.
- terraform
- terraform-docs
- git-chglog

## Examples
Makefile:
```Makefile
apply:
    docker-compose run --rm terraform-utils terraform apply
```

docker-compose:
```yaml
services:
  terraform-utils:
    image: deanillfeld/docker-terraform-utils:latest
    volumes:
      - ~/code:/code
      - ~/.aws:/root/.aws
```

## SELinux
If you have SELinux enabled volume mounts are a bit more complicated. You have 2 options to get around permission denied errors with docker-compose.

Option 1 - Use :Z to automatically relabel files\
**This will remove the existing label on files/directories which may break things**
```yaml
volumes:
      - ~/code:/code:Z
      - ~/.aws:/root/.aws:Z
```
Option 2 - Disable SELinux for the container
```yaml
security_opt:
  - label:disable
```

## Tests
DockerHub should automatically build and test on commit. Tests can be run locally with `make test`. Containers are not automatically cleaned up in the event of test failure. Run `make clean` when you are finished investigating the test failure.