type IDENTIFER = String
type NUM = Int

data Expr = Assign IDENTIFER Expr 
            | And Expr Expr
            | OR  Expr Expr
            | Lt  Expr Expr
            | EQ  Expr Expr
            | NEQ Expr Expr
            | Add Expr Expr
            | Sub Expr Expr
            | Mul Expr Expr
            | Div Expr Expr
            | Mod Expr Expr
            | Brackets Expr
            | Neg Expr
            | Min Expr
            | Id IDENTIFER
            | Num NUM


data St_list = Nil | St_list Stmt
data Stmt = CBrackets St_list 
            | Semicollon Expr
            | If_part
            | Else If_part Stmt
            | While CBrackets Expr Stmt
            | Return Expr Semicollon
            
data If_part = Ifs CBrackets Expr Stmt