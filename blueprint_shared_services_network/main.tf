#############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  version = "<=1.39"
}


#####################################
# backend 
###################################

terraform {
    backend "azurerm" {
    }
}
