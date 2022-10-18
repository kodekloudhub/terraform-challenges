# Challenge 2

In this challenge we will implement a simple LAMP stack using terraform and docker.

Utilize `/root/code/terraform-challenges/challenge2` directory to store your Terraform configuration files.

We will create the resources in the order of their dependencies, thus you may run plan/apply at any stage, or wait till the end.

Note that these challenges do not use an embedded VSCode IDE, therefore we must use the venerable `vi` to create and edit files. Now you can put all the resources into a single file e.g. `main.tf` or as shown here in separate files. Terraform doesn't care!

1.  <details>
    <summary>terraform-jump-host</br>Install terraform binary version=1.1.5 on iac-server</summary>

    ```bash
    curl -L -o /tmp/terraform_1.1.5_linux_amd64.zip https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
    unzip -d /usr/local/bin /tmp/terraform_1.1.5_linux_amd64.zip
    ```
    </details>
1.  <details>
    <summary>docker</br>Docker provider has already been configured using kreuzwerker/docker provider.</br>Check out the provider.tf given at /root/code/terraform-challenges/challenge2</summary>

    ```bash
    cd /root/code/terraform-challenges/challenge2
    cat provider.tf
    ```

    Let's initialize the provider now.

    ```
    terraform init
    ```

    You should now refer to the documentation for this provider. Go to the [Terraform Registry](https://registry.terraform.io/) and paste `kreuzwerker/docker` into the search bar.

    </details>
1.  <details>
    <summary>php-httpd-image</br>Create a terraform resource named php-httpd-image</summary>

    Refer to the provider documentation for [docker-image](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image)

    Using `vi`, create [php-httpd-image.tf](./resources/php-httpd-image.tf)
    </details>
1.  <details>
    <summary>mariadb-custom-image</br>Create a terraform resource named mariadb-image</summary>

    Refer to the provider documentation for [docker-image](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image)

    Using `vi`, create [mariadb-custom-image.tf](./resources/mariadb-custom-image.tf)
    </details>
1.  <details>
    <summary>mariadb-volume</br>Create a terraform resource named mariadb_volume</summary>

    Refer to the provider documentation for [docker-volume](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/volume)

    Using `vi`, create [mariadb-volume.tf](./resources/mariadb-volume.tf)
    </details>
1.  <details>
    <summary>private_network</br>Create a terraform resource named private_network</summary>

    Refer to the provider documentation for [docker-network](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/network)

    Using `vi`, create [private-network.tf](./resources/private-network.tf)
    </details>
1.  <details>
    <summary>db</br>Define a terraform resource mariadb for creating docker container</summary>

    Refer to the provider documentation for [docker-container](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container)

    Using `vi`, create [db.tf](./resources/db.tf)
    </details>
1.  <details>
    <summary>webserver</br>Define a terraform resource php-httpd for creating docker container</summary>

    Refer to the provider documentation for [docker-container](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container)

    Using `vi`, create [webserver.tf](./resources/webserver.tf)
    </details>
1.  <details>
    <summary>db_dashboard</br>Define a terraform resource phpmyadmin for docker container</summary>

    Refer to the provider documentation for [docker-container](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container)

    Using `vi`, create [db-dashboard.tf](./resources/db-dashboard.tf)
    </details>
1.  <details>
    <summary>DEPLOY!</summary>

    ```bash
    terraform plan
    terraform apply
    ```
    </details>
