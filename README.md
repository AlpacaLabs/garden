# garden

[garden.io](https://garden.io/) is a tool for testing your entire stack.

Since I'm not paying for an actual K8s cluster yet, this is what I use 
to emulate a production environment. Garden can build, deploy, and test.

Obviously, a prerequisite for running this is Garden, which you can install from their website.

You'll also need Docker and a local Kubernetes cluster (I'm using the k8s engine provided by 
Docker for Mac, but minikube is a good option as well).

```bash
# Update remote modules
garden update-remote all

# Deploy
garden deploy
```