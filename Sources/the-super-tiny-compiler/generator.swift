//
//  generator.swift
//  
//
//  Created by ericliuhusky on 2021/11/27.
//

func generator(ast: ASTNode) -> String {
    switch ast {
    case let .Program(body: body):
        return body.map { generator(ast: $0) }.joined(separator: "\n")
    case let .CallExpression(name: name, params: params):
        return name + "(" + params.map { generator(ast: $0) }.joined(separator: ",") + ")"
    case let .NumberLiteral(value: value):
        return value
    case let .StringLiteral(value: value):
        return "\"\(value)\""
    }
}
