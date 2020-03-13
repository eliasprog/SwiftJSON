//
//  main.swift
//  Teste2
//
//  Created by Elias Ferreira on 13/03/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import Foundation

enum AppErrors: Error {
  case invalidPath
  case noDocumentsDirectory
}

let aluno1 = Aluno(nome: "lucas", idade: 18)
let aluno2 = Aluno(nome: "Bryan", idade: 19)
let aluno3 = Aluno(nome: "Elias", idade: 28)

var alunos1 = [Aluno]()

alunos1.append(aluno1)
alunos1.append(aluno2)
alunos1.append(aluno3)

let fileManager = FileManager.default

//let jsonData = try! JSONEncoder().encode(alunos1)
//jsonData.write(to: )


guard let documentsDirectory = fileManager.urls(for: .applicationDirectory, in: .userDomainMask).first else {
  throw AppErrors.noDocumentsDirectory
}

let jsonData = try! JSONEncoder().encode(alunos1)
let itemURL = documentsDirectory.appendingPathComponent("myJson.json")

try? jsonData.write(to: itemURL)

guard let data = try? Data(contentsOf: itemURL), let alunos2 = try? JSONDecoder().decode([Aluno].self, from: data) else {
  throw AppErrors.invalidPath
}

for aluno in alunos2 {
  print(aluno.nome)
}



