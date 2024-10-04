Creates resources based on var Design paramaters inputs
  "Enter VPC Name:"
  "Enter VPC CDIR:"
  "Enter VPC Name & CDIR:"
  "Enter VPC Name &  CDIR:"
  "Enter Resource Tags:"
  "Enter EC2 Key Pair Name:"

and the following modules:
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
