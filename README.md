# garden

[garden.io](https://garden.io/) is a tool for testing your entire stack.

Since I'm not paying for an actual K8s cluster yet, this is what I use 
to emulate a production environment. Garden can build your services, 
deploy them into a (remote or local) cluster, and run unit and 
integration tests.

## Getting started
Obviously, a prerequisite for running this is Garden, which you can 
install from their website.

You'll also need Docker and a Kubernetes cluster. I'm running a local k8s 
cluster with Docker for Mac, but minikube is a good option as well.

### Cloning Alpaca services
You should only need to run this once.
```bash
# Only 
make clone
```

### Linking remote modules
By default, this Garden configuration will use services as they exist in `master`.

If you want to do iterative development locally, you'll need to use the "garden link" command.
This will allow you to make experimental code changes in different repos in different directories from this one,
and Garden will automatically build and deploy and re-run tests/tasks.
 
You should only need to run this once.
```bash
make link
```

### Use Garden
```bash
# Update remote modules (you don't need to do this if you've run the link command)
make update

# Watch for changes
garden dev

# Run all tests
garden test

# Run tests for password API, forcefully, watching for changes
garden test --name=integ-password --force --watch
```