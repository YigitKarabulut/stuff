//
//  ChatViewController.swift
//  stuff
//
//  Created by Yigit on 23.09.2022.
//

import UIKit
import MessageKit
import Parse
import InputBarAccessoryView
struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: MessageKit.SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKit.MessageKind
    
    
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate, InputBarAccessoryViewDelegate {
    
    var receiveUsername = ""
    let currentUser = Sender(senderId: (PFUser.current()?.objectId)!, displayName: (PFUser.current()?.username)!)
    
    var messages = [MessageType]()
    
    var receiveId = ""
    var advertId = ""
    var messageArray = [String]()
    var messageIdArray = [String]()
    var dateArray = [Date]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.scrollToLastItem(animated: true)

        messagesCollectionView.messagesCollectionViewFlowLayout.setMessageIncomingAvatarSize(.zero)
        messagesCollectionView.messagesCollectionViewFlowLayout.setMessageOutgoingAvatarSize(.zero)
        
        getMessagesData()
        getReceiveUserData()
        getReceiverMessageData()
        
        
//        messagesCollectionView.messagesCollectionViewFlowLayout.setMessageIncomingMessageBottomLabelAlignment(LabelAlignment(textAlignment: NSTextAlignment.left, textInsets: .zero))
//        messagesCollectionView.messagesCollectionViewFlowLayout.setMessageIncomingMessageTopLabelAlignment(LabelAlignment(textAlignment: NSTextAlignment.left, textInsets: .zero))
//        messagesCollectionView.messagesCollectionViewFlowLayout.setMessageOutgoingMessageBottomLabelAlignment(LabelAlignment(textAlignment: NSTextAlignment.right, textInsets: .zero))
//        messagesCollectionView.messagesCollectionViewFlowLayout.setMessageOutgoingMessageTopLabelAlignment(LabelAlignment(textAlignment: NSTextAlignment.right, textInsets: .zero))
        messagesCollectionView.reloadData()
     
        
        
        
    }
    
    
    func getReceiveUserData() {
        let query = PFQuery(className: "_User")
        query.whereKey("username", equalTo: receiveUsername).findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            if let receiveIdd = object.objectId {
                                self.receiveId = receiveIdd
                            }
                        }
                    }
                }
            }
        }
    }
        
    
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String)  {
        let object = PFObject(className: "Chat")
        object["sender"] = PFUser.current()!.username!
        object["receiver"] = self.receiveUsername
        object["message"] = text
        object["advertId"] = self.advertId
        object["d"] = Date.now
        object.saveInBackground { success, error in
            if error != nil {
                print("error")
            } else {
                print("success")
            }
        }
        self.messagesCollectionView.reloadData()
        inputBar.inputTextView.text = ""
            
    }
           
    func getMessagesData(){
        let query = PFQuery(className: "Chat")
        query.whereKey("sender", equalTo: PFUser.current()!.username!).whereKey("receiver", equalTo: receiveUsername).whereKey("advertId", equalTo: advertId).findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            if let message = object.object(forKey: "message") as? String {
                                if let messageId = object.objectId {
                                    if let date = object.object(forKey: "d") as? Date {
                                        self.dateArray.append(date)
                                        self.messageArray.append(message)
                                        self.messages.append(Message(sender: self.currentUser, messageId: messageId, sentDate: date, kind: .text(message)))
                                        self.messagesCollectionView.reloadData()
                                    }
                                    
                                }
                               
                            }
                           
                         
                            
                        }
                    }
                }
            }
        }
    }
     
    
    func getReceiverMessageData() {
        let query = PFQuery(className: "Chat")
        query.whereKey("receiver", equalTo: PFUser.current()!.username!).whereKey("advertId", equalTo: advertId).findObjectsInBackground { objects, error in
            if error != nil {
//                makeAlert
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        for object in objects! {
                            if let message = object.object(forKey: "message") as? String {
                                if let messageId = object.objectId {
                                    if let date = object.object(forKey: "d") as? Date {
                                        self.dateArray.append(date)
                                        self.messageArray.append(message)
                                        self.messages.append(Message(sender: Sender(senderId: self.receiveId, displayName: self.receiveUsername), messageId: messageId, sentDate: date, kind: .text(message)))
                                        self.messagesCollectionView.reloadData()
                                    }
                                    
                                }
                               
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    var currentSender: SenderType {
        return currentUser
    }
    
   
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
       
        return messages.count
        
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
       
    
        return messages[indexPath.section]
        
    }

    
    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
           return NSAttributedString(
               string: MessageKitDateFormatter.shared.string(from: message.sentDate),
               attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.gray])    }
    

    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
           return 30
       }
    
   

}
