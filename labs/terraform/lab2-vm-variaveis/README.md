📘 Terraform Lab – Provisionando uma VM Linux na Azure

Este repositório contém o laboratório onde foi criada uma infraestrutura completa na Azure utilizando Terraform, seguindo boas práticas de organização, variáveis, outputs e segurança (sem expor senha ou subscription ID no GitHub).

🏗️ Arquitetura criada

Ao rodar o Terraform, a seguinte estrutura é provisionada:

Resource Group (existente)
│
├── Public IP
├── Network Security Group (NSG)
│     └── Regra de SSH (porta 22)
├── Virtual Network (VNet)
│     └── Subnet
├── Network Interface (NIC)
│     └── Associação com o NSG
│
└── Linux Virtual Machine (Ubuntu 20.04)


Tudo é criado de forma declarativa utilizando Terraform.

🚀 Recursos Provisionados

O código cria automaticamente:

🟦 Public IP

🟩 Virtual Network (VNet)

🟨 Subnet

🟪 Network Security Group (NSG) + regras

🟧 Network Interface (NIC)

🔵 Linux VM (Ubuntu 20.04)

A VM é criada na região definida em variables.tf (neste lab: West US, por causa das limitações da conta da SPTech).

🔐 Segurança (Boas Práticas Adotadas)

Para evitar vazamento de informações sensíveis no GitHub:

❌ Senha não está no código
→ variável admin_password é definida via terraform.tfvars (ignorado)

❌ Subscription ID e Tenant ID não aparecem no repositório
→ o provider usa autenticação via az login

❌ State não é versionado
→ .gitignore evita envio de terraform.tfstate

❌ Chaves e arquivos sensíveis são ignorados
→ *.pem, *.key, terraform.tfvars incluídos no .gitignore

📦 Pré-requisitos

Antes de iniciar, instale:

Terraform ≥ 1.0

Azure CLI (az)

Conta da Azure configurada

Rodar:

az login


para autenticar sua sessão.

⚙️ Como executar o projeto
1. Clone o repositório
git clone https://github.com/SEU_USUARIO/seu-repo.git
cd seu-repo

2. Crie seu arquivo terraform.tfvars

⚠️ Este arquivo NÃO vai para o GitHub.

Crie:

nano terraform.tfvars


E adicione:

admin_password = "SUA_SENHA_AQUI"

3. Inicialize o Terraform
terraform init

4. Valide o código
terraform validate

5. Veja o plano de criação
terraform plan

6. Execute o deploy
terraform apply


Digite yes para confirmar.

🖥️ Conectando na VM

Após o deploy:

terraform output public_ip_address


Conecte via SSH:

ssh azurerm@SEU_IP


A senha é a definida no terraform.tfvars.

🧹 Remover toda a infraestrutura

Para destruir os recursos criados:

terraform destroy

📂 Estrutura de arquivos
.
├── main.tf              # Recursos principais
├── variables.tf         # Variáveis do projeto
├── provider.tf          # Configuração do provider Azure
├── output.tf            # Outputs úteis
├── terraform.tfvars     # Senha (ignorado no Git)
└── .gitignore           # Segurança do projeto

📚 Aprendizados do Lab

Como provisionar uma VM Linux na Azure via Terraform

Como lidar com SKUs indisponíveis em regiões

Como limpar configurações sensíveis antes de subir para o GitHub

Como estruturar Terraform com provider, variables, outputs e resources

Como autenticar na Azure usando az login em vez de colocar secrets no código
