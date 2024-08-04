# Ubuntu Kubernetes Deployment Image

![Docker Image Version](https://img.shields.io/badge/version-latest-blue.svg)

This Docker image is designed to facilitate seamless deployment of Kubernetes applications in your CI/CD pipelines. Built on the latest Ubuntu base, this image includes the essential tools for managing Kubernetes clusters directly from within your Docker containers.

## Features

- **Base Image**: Built on the latest Ubuntu, ensuring a stable and secure environment.
- **Kubernetes CLI**: Includes `kubectl` and `helm`, the command-line tools for interacting with Kubernetes clusters.
- Docker CLI: Includes `docker`, the command-line tool for building and managing Docker containers.
- **Lightweight**: Built with a minimal set of dependencies, ensuring faster build times and reduced image sizes.
- **Easy to Use**: The image comes with a default command that opens a Bash shell, allowing for easy interaction and execution of commands.

## Installation

You can pull this image from Docker Hub by running:

```bash
docker pull arthurdw/ubuntu-k8s-deploy:latest
```

## Usage

This image is intended for use in your Kubernetes CI/CD processes. You can run a container using the following command:

```bash
docker run -it --rm arthurdw/ubuntu-k8s-deploy
```

Once inside the container, you can use `kubectl` to manage your Kubernetes resources. For example:

```bash
kubectl get pods
```

## Example Deployment

You can use this image in your Kubernetes deployment pipelines. Here’s a brief example of how you might configure it in a CI/CD tool:

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to Kubernetes
        uses: arthurdw/ubuntu-k8s-deploy:latest
        with:
          args: kubectl apply -f deployment.yaml
```

## Contributing

If you have suggestions for improvements or new features, feel free to submit a pull request or open an issue in this repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
