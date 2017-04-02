# User < Devise

# Account
user:references
name:string
is_disabled:boolean
order:integer

br g scaffold Account user:references name:string is_disabled:boolean order:integer

# Category
user:references
name:string
is_disabled:boolean
order:integer

# SubCategory
category:references
name:string
is_disabled:boolean
order:integer

# Store
user:references
name:string
tel:integer
address:string
is_disabled:boolean
order:integer

# Log
user:references
logged_at:datetime
ammount:decimal
is_expence:boolean
account:references
sub_category:references
store:references
item:string
memo:string

