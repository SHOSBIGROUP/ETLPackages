# Load the IntegrationServices Assembly  
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Management.IntegrationServices")  

# Store the IntegrationServices Assembly namespace to avoid typing it every time  
$ISNamespace = "Microsoft.SqlServer.Management.IntegrationServices"  

Write-Host "Connecting to server ..."  

# Create a connection to the server  
$sqlConnectionString = "Data Source=AZSQL01;Initial Catalog=master;UID=mssql_etl;PWD=R985%&*#hgt674QW;"  
$sqlConnection = New-Object System.Data.SqlClient.SqlConnection $sqlConnectionString  

# Create the Integration Services object  
$integrationServices = New-Object $ISNamespace".IntegrationServices" $sqlConnection  

# Provision a new SSIS Catalog  
$catalog = New-Object $ISNamespace".Catalog" ($integrationServices, "SSISDB", "R985%&*#hgt674QW")  
$catalog.Create()  