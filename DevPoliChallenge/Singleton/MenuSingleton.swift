//
//  MenuSingleton.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 08/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class MenuSingleton {
    
    static let shared = MenuSingleton()

        var sections: [TableSection] = [
            .init(title: "Entradas", rows: [
                .init(title: "Salada Caprese", description: "Tomate, muçarela de búfala, manjericão e azeite de oliva.", price: "25,90", category: [.init(id: 1, category: "Entradas")]),
                .init(title: "Bruschetta", description: "Pão italiano com tomate, manjericão e azeite de oliva.", price: "19,90", category: [.init(id: 1, category: "Entradas")]),
                .init(title: "Carpaccio", description: "Carne crua fatiada, regada com molho de mostarda e alcaparras.", price: "29,90", category: [.init(id: 1, category: "Entradas")]),
            ]),
            .init(title: "Carnes", rows: [
                .init(title: "Bife à Parmegiana", description: "Bife empanado coberto com molho de tomate e queijo derretido, acompanhado de arroz e batata frita.", price: "45,90", category: [.init(id: 2, category: "Carnes")]),
                .init(title: "Filé Mignon", description: "Filé mignon grelhado com molho de cogumelos, acompanhado de purê de batatas.", price: "55,90", category: [.init(id: 2, category: "Carnes")]),
                .init(title: "Costela BBQ", description: "Costela suína assada com molho barbecue, acompanhada de batatas rústicas.", price: "39,90", category: [.init(id: 2, category: "Carnes")]),
                .init(title: "Strogonoff", description: "Cubos de carne macia, creme de leite, champignons e temperos especiais.", price: "35,90", category: [.init(id: 2, category: "Carnes")]),
                .init(title: "Bife a Cavalo", description: "Bife grelhado e ovo estrelado.", price: "29,90", category: [.init(id: 2, category: "Carnes")]),
            ]),
            .init(title: "Peixes", rows: [
                .init(title: "Salmão Grelhado", description: "Salmão grelhado com legumes ao vapor.", price: "38,50", category: [.init(id: 3, category: "Peixes")]),
                .init(title: "Moqueca de Peixe", description: "Peixe cozido em leite de coco, dendê, pimentões e coentro, acompanhado de arroz e pirão.", price: "42,90", category: [.init(id: 3, category: "Peixes")]),
            ]),
            .init(title: "Massas", rows: [
                .init(title: "Nhoque ao Molho Pesto", description: "Nhoque de batata com molho pesto de manjericão.", price: "29,90", category: [.init(id: 4, category: "Massas")]),
                .init(title: "Lasanha à Bolonhesa", description: "Lasanha com camadas de massa intercaladas com molho bolonhesa, molho branco e queijo.", price: "35,90", category: [.init(id: 4, category: "Massas")]),
            ]),
            .init(title: "Sobremesas", rows: [
                .init(title: "Tiramisu", description: "Sobremesa clássica italiana à base de café, creme de queijo mascarpone e cacau em pó.", price: "15", category: [.init(id: 5, category: "Sobremesa")]),
                .init(title: "Pudim de Leite", description: "Pudim de leite condensado com calda de caramelo.", price: "11", category: [.init(id: 5, category: "Sobremesa")]),
                .init(title: "Mousse de Chocolate", description: "Mousse de chocolate com chantilly.", price: "14,50", category: [.init(id: 5, category: "Sobremesa")]),
            ]),
            .init(title: "Bebidas", rows: [
                .init(title: "Água Mineral", description: "Água mineral com ou sem gás.", price: "5", category: [.init(id: 6, category: "Bebidas")]),
                .init(title: "Caipirinha", description: "Bebida refrescante feita com cachaça, limão, açúcar e gelo.", price: "12,50", category: [.init(id: 6, category: "Bebidas")]),
                .init(title: "Cerveja", description: "Cervejas diversas, como pilsen, lager e IPA.", price: "8,50", category: [.init(id: 6, category: "Bebidas")]),
                .init(title: "Mojito", description: "Bebida refrescante feita com rum, hortelã, limão, açúcar e água com gás.", price: "14,90", category: [.init(id: 6, category: "Bebidas")]),
                .init(title: "Refrigerante", description: "Refrigerante de cola ou guaraná.", price: "6", category: [.init(id: 6, category: "Bebidas")]),
            ]),
        ]

        public init() {}
}
