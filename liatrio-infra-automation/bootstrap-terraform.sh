mkdir -p ~/.ssh 2> /dev/null
chmod +w ~/.ssh/LiatrioKeyPairFinal.pem 2> /dev/null
echo "Host * " > ~/.ssh/config
echo "    StrictHostKeyChecking no " >> ~/.ssh/config
rm -f ~/.ssh/LiatrioKeyPairFinal.pem
aws ec2 create-key-pair --key-name LiatrioKeyPairFinal --query 'KeyMaterial' --output text > ~/.ssh/LiatrioKeyPairFinal.pem
chmod 400 ~/.ssh/LiatrioKeyPairFinal.pem
python transpose.py terraform/liatrio-ec2.tf
cd terraform
terraform init
terraform apply -auto-approve
