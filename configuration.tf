terraform { 
  cloud { 
    
    organization = "ibm-client-engineering" 

    workspaces { 
      name = "terraform-ansible-demo-ws" 
    } 
  } 
}
