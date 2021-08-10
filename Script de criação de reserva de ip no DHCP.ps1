# Script de criação de reserva de IP no DHCP  - Créditos Gabriel Luiz - www.gabrielluiz.com ##


# Verifica as informações do escopo IPV4 já criado.

Get-DhcpServerv4Scope -ComputerName "DHCP"


# Cria a reservar de IP no DHCP.

Add-DhcpServerv4Reservation -ScopeId 10.101.0.0 -IPAddress 10.101.0.55 -Name "Impressora do RH" -ClientId "F0-DE-F1-7A-00-5E" -Description "Reserva da Impressora do RH" -Type Dhcp


# Observação: O comando acima deve ser executado diretamente no servidor que possui a função DHCP instalada.


Add-DhcpServerv4Reservation -ComputerName "DHCP.gabrielluiz.local" -ScopeId 10.101.0.0 -IPAddress 10.101.0.55 -Name "Impressora do RH" -ClientId "F0-DE-F1-7A-00-5E" -Description "Reserva da Impressora do RH" -Type Dhcp


# Observação: O comando pode ser executado remotamente, basta informar o hostname com FQDN do servidor DHCP com a função DHCP instalada. Necessário ter o RSAT-DHCP instalado no servidor que você deseja executar do comando remoto.



# Importa as reservas IPs criadas utilizando um arquivo .CSV.

Import-Csv -Path "reservas-dhcp.csv" | Add-DhcpServerv4Reservation -ComputerName "DHCP.gabrielluiz.local"



# Verifica se RSAT-DHCP já esta instalado.

Get-WindowsFeature -Name RSAT-DHCP



# Instala o RSAT-DHCP.

Install-WindowsFeature -Name RSAT-DHCP


<#

Referências:

https://docs.microsoft.com/en-us/powershell/module/dhcpserver/add-dhcpserverv4reservation?view=windowsserver2019-ps&WT.mc_id=WDIT-MVP-5003815

https://docs.microsoft.com/en-us/powershell/module/dhcpserver/set-dhcpserverv4reservation?view=windowsserver2019-ps&WT.mc_id=WDIT-MVP-5003815

https://docs.microsoft.com/en-us/powershell/module/servermanager/get-windowsfeature?view=winserver2012r2-ps&WT.mc_id=WDIT-MVP-5003815

https://docs.microsoft.com/en-us/powershell/module/servermanager/install-windowsfeature?view=winserver2012r2-ps&WT.mc_id=WDIT-MVP-5003815

https://docs.microsoft.com/pt-br/powershell/module/dhcpserver/?view=windowsserver2019-ps&WT.mc_id=WDIT-MVP-5003815

#>
