//
//  tokenizer.swift
//  
//
//  Created by ericliuhusky on 2021/11/27.
//

struct Token {
    enum TokenType {
        case paren
        case number
        case string
        case name
    }
    
    var type: TokenType
    var value: String
}

func tokenizer(input: String) -> [Token] {
    var tokens = [Token]()
    
    var current = 0
    
    while current < input.count {
        var char = input[input.index(input.startIndex, offsetBy: current)]
        
        if char == "(" {
            tokens.append(.init(type: .paren, value: "("))
            current += 1
            continue
        }
        
        if char == ")" {
            tokens.append(.init(type: .paren, value: ")"))
            current += 1
            continue
        }
        
        if char.isWhitespace {
            current += 1
            continue
        }
        
        if char.isNumber {
            var value = ""
            while char.isNumber {
                value += String(char)
                current += 1
                char = input[input.index(input.startIndex, offsetBy: current)]
            }
            
            tokens.append(.init(type: .number, value: value))
            continue
        }
        
        if char == "\"" {
            var value = ""
            current += 1
            char = input[input.index(input.startIndex, offsetBy: current)]
            while char != "\"" {
                value += String(char)
                current += 1
                char = input[input.index(input.startIndex, offsetBy: current)]
            }
            current += 1
            tokens.append(.init(type: .string, value: value))
            continue
        }
        
        if char.isLetter {
            var value = ""
            while char.isLetter {
                value += String(char)
                current += 1
                char = input[input.index(input.startIndex, offsetBy: current)]
            }
            tokens.append(.init(type: .name, value: value))
            continue
        }
        
        assertionFailure("字符无法识别")
    }
    
    return tokens
}
