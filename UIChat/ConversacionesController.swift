//
//  ConversacionesController.swift
//  UIChat
//
//  Created by Maestro on 18/05/17.
//  Copyright © 2017 Emiliano Lopez. All rights reserved.
//

import Foundation
import UIKit
import JSQMessagesViewController

class ConversacionesController : UITableViewController {

    let conversaciones = ["Pedrillo", "Miranda de otra dimension", "Butriz", "Gabu", "Emiliano"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversaciones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaConversacion")
        celda?.textLabel?.text = conversaciones[indexPath.row]
        return celda!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //En esta parte decimos que dimos clic a una celda que me llevara a la conversacion
        if segue.identifier == "goToChat"{
            let destino = segue.destination as? JSQMessagesViewController //Para inicializar esto y que nos lleve a la pantalla deseada tenemos que tener llenos los dos campos de abajo.
            destino?.senderId = "1234" //esto lo tenemos que sacar del servidor
            destino?.senderDisplayName = "Usuario" //Esto tambien se saca deñ servidor
        }
    }
    
}
