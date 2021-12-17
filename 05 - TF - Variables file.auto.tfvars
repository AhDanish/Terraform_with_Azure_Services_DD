location = "canadacentral"
NameSuffix = "tf"

VNet-AddressSpace = ["11.0.0.0/16", "14.0.0.0/16", "15.0.0.0/16"]

mysqldb_Name = "mysqldb01"
db_storage_mb = 5120
db_auto_grow_enabled = "true"

/*
db_thrtdetpolicy = {
 enabled = true
 retention_days = 7
 email_account_admins = true
 email_addresses = [ "Hammad@thecloudheros.com", "mr@thecloudheros.com" ]
 }
*/

db_thrtdetpolicy = [true, 7, true, ["Hammad@thecloudheros.com", "mr@thecloudheros.com" ]]

 
 