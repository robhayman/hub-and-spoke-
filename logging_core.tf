############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  version = "<=1.39"
}


############################################################################
# DATA
#############################################################################

module "logging_core" {

data "terraform_remote_state" "logging_core" {
  backend = "remote"

  config = {
    storage_account_name  = var.lowerlevel_storage_account_name
    container_name        = var.lowerlevel_container_name 
    resource_group_name   = var.lowerlevel_resource_group_name
    key                   = "logging_core.tfstate"
  }
}

locals {
    logging_core     = data.terraform_remote_state.logging_core.outputs.blueprint_foundations

 

    log_analytics_workspace   = local.logging_core["log_analytics_workspace"]
    diagnostics_map           = local.logging_core["diagnostics_map"]
    diagnostics_settings      = local.logging_core["diagnostics_settings"]    
}


module.logging_core.log_analytics_workspace
module.logging_core.diagnostics_map
module.logging_core.diagnostics_settings