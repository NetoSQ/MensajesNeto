//
//  ViewController.swift
//  UIChat
//
//  Created by Emiliano Lopez on 17/05/17.
//  Copyright © 2017 Emiliano Lopez. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ViewController: JSQMessagesViewController {
    
    lazy var outgoingBubble : JSQMessagesBubbleImage = self.setupOutgoingBubble()
    lazy var incomingBubble : JSQMessagesBubbleImage = self.setupIncomingBubble()
    
    var mensajes = [JSQMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero //aqui decimos que no nos renderee los avatars, osea los profile de los contactos
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        addMensaje(conId: "1234", displayName: "Miranda", texto: "Holi :3")
        addMensaje(conId: "5678", displayName: "Lila", texto: "Hola humana")
        addMensaje(conId: "1234", displayName: "Miranda", texto: "No has tirado la comida?")
        addMensaje(conId: "5678", displayName: "Lila", texto: "No, pero me comi la comida del Lucas")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        finishReceivingMessage() //Avisa que ya terminamos de mendar mensajes, para que asi aparezcan
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return mensajes[indexPath.item]
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mensajes.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let mensaje = mensajes[indexPath.item]
        if mensaje.senderId == senderId {
            return outgoingBubble
        } else {
            return incomingBubble
        }
    }
    
    private func setupOutgoingBubble() -> JSQMessagesBubbleImage{
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        return (bubbleFactory?.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue()))!
    }
    
    private func setupIncomingBubble() -> JSQMessagesBubbleImage{
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        return bubbleFactory!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
    }
    
    private func addMensaje(conId id: String, displayName: String, texto: String){
        let mensaje = JSQMessage(senderId: id, displayName: displayName, text: texto)
        mensajes.append(mensaje!)
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }

}

