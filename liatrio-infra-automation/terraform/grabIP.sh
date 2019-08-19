cat terraform.tfstate | grep public_ip | awk -F\" '{print $4}' | tail -1
