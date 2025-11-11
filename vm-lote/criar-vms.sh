#!/bin/bash

RESOURCE_GROUP="terraform-demo-rg"
LOCATION="westus"
SIZE="Standard_B1s"
PASSWORD="SenhaForte123!"

criar_vm() {
  local NOME_VM=$1
  echo "🚀 Criando VM: $NOME_VM (size=$SIZE, location=$LOCATION)"

  az vm create \
    --resource-group "$RESOURCE_GROUP" \
    --name "$NOME_VM" \
    --image Ubuntu2204 \
    --size "$SIZE" \
    --admin-username azureuser \
    --admin-password "$PASSWORD" \
    --authentication-type password \
    --location "$LOCATION" \
    --no-wait
}

VMS=(vm01 vm02)

for nome in "${VMS[@]}"; do
  criar_vm "$nome"
done

echo "✅ Criação em lote iniciada. Aguarde as VMs serem provisionadas."
