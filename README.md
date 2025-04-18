# cyclecloud-ubuntupro

This project integrates Ubuntu Pro with Azure CycleCloud to provide enhanced security, compliance, and support for HPC workloads. It enables users to employ their existing Ubuntu Pro subscription by automatically attaching and detaching VMs as needed. 

## Pre-Requisites

- An active Ubuntu Pro subscription.
- Azure CycleCloud installed and running (CycleCloud 8.0 or later).

## Configuring the Project ##
1. Open a terminal session in CycleCloud server with the CycleCloud CLI enabled.
2. Clone the cyclecloud-ubuntupro repo
``` bash
$ git clone  https://github.com/egmsft/cyclecloud-ubuntupro.git
```
3. Swtich to the `cyclecloud-ubuntupro` project directory and upload the project to the cyclecloud locker.
``` bash
$ cd cyclecloud-ubuntupro/
$ cyclecloud project upload <locker name>
```

4. Import the required template
``` bash
cyclecloud import_template -f templates/slurm-ubuntupro.txt -c Slurm slurm-ubuntupro 
```
## Creating the cluster ##

1. After the import you should see an entry for `slurm-ubuntupro` under the list of supported schedulers. Select the template to build the cluster. 

2. Follow the steps to configure the cluster. 

3. Once you reach the `Ubuntu Pro` tab, enter your token for your Ubuntu Pro Subscription

## Testing the cluster ##

After configuring the cluster, you can start it and validate that the VMs are getting attached to your subscription. 

``` bash
pro status
```
Note, when VMs get deallocated, the VMs will detach from your subscription before they get terminated. The detachment is done using scheduled events and CycleCloud's jetpack will log the successful execution of the onTerminate.sh script that gets applied during the VM's initial configuration. 
