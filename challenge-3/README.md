# Challenge 3

In this challenge we will implement a simple EC2 instance with some preinstalled packages.

Utilize `/root/terraform-challenges/project-citadel` directory to store your Terraform configuration files.

We will create the resources in the order of their dependencies, thus you may run plan/apply at any stage, or wait till the end.

Note that these challenges do not use an embedded VSCode IDE, therefore we must use the venerable `vi` to create and edit files. Now you can put all the resources into a single file e.g. `main.tf` or as shown here in separate files. Terraform doesn't care!

1.  <details>
    <summary>Enter the project directory</summary>

    ```bash
    cd /root/terraform-challenges/project-citadel
    ```

    You should now refer to the documentation for this provider. Go to the [Terraform Registry](https://registry.terraform.io/). The AWS provider is on the front page.

    </details>
1.  <details>
    <summary>Declare variables</summary>

    Both in `provider.tf` which is already present, and in the `citadel` task, variables will be referenced. Let's create them now.

    Using `vi`, create [variables.tf](./resources/variables.tf)

    We can now initialize the provider

    ```bash
    terraform init
    ```

1.  <details>
    <summary>SSH-key-citadel</br>Create a terraform key-pair citadel-key with key_name citadel</summary>

    Refer to the provider documentation for [aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) and the core documentation for the [file](https://www.terraform.io/language/functions/file) function.

    Using `vi`, create [ec2_elastic_ip.tf](./resources/ec2_elastic_ip.tf)

1.  <details>
    <summary>citadel/nginx-script</br>Create the EC2 instance</summary>

    This step covers both the `citadel` and `Nginx-script` tasks, since the installation of nginx is performed by the user data script of the EC2 instance.

    Refer to the provider documentation for [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) and the core documentation for the [file](https://www.terraform.io/language/functions/file) function.

    Using `vi`, create [citadel.tf](./resources/citadel.tf)

    </details>
1.  <details>
    <summary>EC2_Elastic_IP</br>Create a local-exec provisioner for the eip resource and use it to print the attribute called public_dns to a file /root/citadel_public_dns.txt on the iac-server</summary>

    Refer to the provider documentation for [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) and the core documentation for [local-exec provisioner](https://www.terraform.io/language/resources/provisioners/local-exec)

    Using `vi`, create [ec2_elastic_ip.tf](./resources/ec2_elastic_ip.tf)


    </details>
1.  <details>
    <summary>DEPLOY!</summary>

    ```bash
    terraform plan
    terraform apply
    ```
    </details>

