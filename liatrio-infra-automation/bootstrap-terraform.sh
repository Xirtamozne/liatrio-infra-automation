aws ec2 create-key-pair --key-name LiatrioKeyPairFinal --query 'KeyMaterial' --output text > ~/.ssh/LiatrioKeyPairFinal.pem
chmod 400 ~/.ssh/LiatrioKeyPairFinal.pem
python transpose.py terraform/liatrio-ec2.tf
cd terraform
terraform apply -auto-approve
