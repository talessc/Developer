//
//  Notificacoes.swift
//  Agenda
//
//  Created by Tales Seixas de Carvalho on 21/08/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Notificacoes: NSObject {

    func exibeNotificacaoDeMediaDosAlunos (dicionarioDeMedia:Dictionary<String, Any>) -> UIAlertController?{
        if let media = dicionarioDeMedia["media"] as? String {
            let alerta = UIAlertController(title: "Atenção", message: "A média geral dos alunos é:\(media) ", preferredStyle: .alert)
            let botao = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(botao)
            return alerta
        }
        return nil
    }
   }
