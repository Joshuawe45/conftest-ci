package main



name = input.metadata.name

required_deployment_labels {
	input.metadata.labels["app.kubernetes.io/env"]
}

deny[msg] {
  input.kind == "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot

  msg := "Containers must not run as root"
}


deny[msg] {
   input.kind="Deployment"
	not required_deployment_labels
	msg = sprintf("%s must include label env", [name])
}