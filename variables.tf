variable "tags" {
  type        = map(any)
  description = "Please provide a list of tags"
  default = {
    Dept    = "IT"
    Team    = "DevOps"
    Quarter = "1"
  }
}



variable users {
  type = list 
  description = "Please supply name of the users"
  default = [
    "bob1",
    "sam1",
    "lisa1",    
  ]
}