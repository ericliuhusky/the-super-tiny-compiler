//
//  parser.swift
//  
//
//  Created by ericliuhusky on 2021/11/27.
//

indirect enum ASTNode {
    case NumberLiteral(value: String)
    case StringLiteral(value: String)
    case CallExpression(name: String, params: [ASTNode])
    case Program(body: [ASTNode])
}

func parser(tokens: [Token]) -> ASTNode {
    var current = 0
    
    func walk() -> ASTNode {
        var token = tokens[current]
        
        if token.type == .number {
            current += 1
            
            return ASTNode.NumberLiteral(value: token.value)
        }
        
        if token.type == .string {
            current += 1
            
            return  ASTNode.StringLiteral(value: token.value)
        }
        
        if token.type == .paren && token.value == "(" {
            current += 1
            token = tokens[current]
            
            var params = [ASTNode]()
            let name = token.value
            
            current += 1
            token = tokens[current]
            
            while token.type != .paren || (token.type == .paren && token.value != ")") {
                params.append(walk())
                token = tokens[current]
            }
            
            current += 1
            
            return ASTNode.CallExpression(name: name, params: params)
        }
        
        fatalError("Token无法识别")
    }
    
    var body = [ASTNode]()
        
    while current < tokens.count {
        body.append(walk())
    }
    
    return ASTNode.Program(body: body)
}
