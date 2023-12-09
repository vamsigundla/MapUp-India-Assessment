Deployment Procedure:

Apply the Kubernetes manifests:


kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f horizontalpodautoscaler.yaml
Monitor the deployment and autoscaling:


kubectl get pods
kubectl get deployments
kubectl get services
kubectl get hpa