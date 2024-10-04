Creates resources based on var Design paramaters inputs
  VPC Name
  VPC CDIR
  pub sub Name(s) & CDIR(s)
  pri sub Name(s) & CDIR(s)
  Resource Tags
  EC2 Key Pair Name

with the following modules:
  VPC:
  Sub:
    Pub & Pri subnet(s)
    Public Route Table,
    Private Route Table,
    RT Table associations
  IGW:
    IGW
    pub-rt default rt via IGW
  EC2:
    pub SG
    pub EC2
    pub EC2 Ami  
