//
//  Aluno.swift
//  Teste2
//
//  Created by Elias Ferreira on 13/03/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import Foundation

class Aluno: Codable {
  let nome: String
  let idade: Int
  let escola: Escola
  
  init(nome: String, idade: Int){
    self.nome = nome
    self.idade = idade
    self.escola = Escola(nome: "Christus", endereco: "Benfica")
  }
  
}

class Escola: Codable {
  let nome: String
  let endereco: String
  
  init(nome: String, endereco: String) {
    self.nome = nome
    self.endereco = endereco
  }
}
