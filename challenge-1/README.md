# Challenge 1

In this challenge we will deploy several Kubernetes resources using terraform. If you don't know Kubernetes, this is going to be somewhat confusing as the resource schema really only makes sense if you understand Kubernetes.

Note that `kubectl` is installed on the host, so you can check your deployed resources in the usual way.

Utilize `/root/terraform_challenge` directory to store your Terraform configuration files.

We will create the resources in the order of their dependencies, thus you may run plan/apply at any stage, or wait till the end.

Note that these challenges do not use an embedded VSCode IDE, therefore we must use the venerable `vi` to create and edit files. Now you can put all the resources into a single file e.g. `main.tf` or as shown here in separate files. Terraform doesn't care!

1.  <details>
    <summary>controlplane</br>Terraform version: 1.1.5 installed on controlplane?</summary>

    ```bash
    which terraform
    ```

    > Nothing! Therefore we must install it. Note that unzip is also not installed, and we need that too!

    ```bash
    apt update
    apt install unzip -y
    curl -L -o /tmp/terraform_1.1.5_linux_amd64.zip https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
    unzip -d /usr/local/bin /tmp/terraform_1.1.5_linux_amd64.zip
    ```
    </details>
1.  <details>
    <summary>kubernetes-provider</br>Configure terraform and provider settings within provider.tf file</summary>

    ```bash
    cd /root/terraform_challenge
    ```

    You should now refer to the documentation for this provider. Go to the [Terraform Registry](https://registry.terraform.io/) and paste `hashicorp/kubernetes` into the search bar. This will give you the latest version, so adjust the URL in your browser to `2.11.0`

    Click on the **USE PROVIDER** button for the configuration block. Copy this, and use `vi` to create [provider.tf](./resources/provider.tf). Paste in and adjust as per the question requirements.

    Now we can initialize the provider

    ```bash
    terraform init
    ```
    </details>
1.  <details>
    <summary>frontend</br>Create a terraform resource frontend for kubernetes deployment</summary>

    Refer to the provider documentation for [kubernetes_deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/deployment)

    If you know Kubernetes, you will see that the resource schema is logically arranged very similarly to the corresponding YAML manifest.

    Using `vi`, create [frontend.tf](./resources/frontend.tf)

    </details>
1.  <details>
    <summary>webapp-service</br>Create a terraform resource webapp-service for kubernetes service</summary>

    Refer to the provider documentation for [kubernetes_service](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/service)

    Now this one's a bit tricky. We need to associate the service with the label assigned to the pods of the deployment. This means that the section

    ```
    spec {
        selector {

        }
    }
    ```

    ...is going to be rather complex as we have to drill right down into the pod template spec to get the label value.
    You could cheat and just put `name = "webapp"` but that defeats the object and doesn't create a dependency between deployment and service.

    Using `vi`, create [frontend.tf](./resources/webapp-service.tf)
    </detail>
1.  <details>
    <summary>DEPLOY!</summary>

    ```bash
    terraform plan
    terraform apply
    ```


