//
//  ConsultViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 27.11.2023.
//

import UIKit

struct Chat{
    let name: String
    let lastMessage: String
    let avatarImage: String
    let isUnread: Bool
    let date: Date
}

class ConsultViewController: UIViewController {
    
    private var consultChats: [Chat] = []
    private var friendsChats: [Chat] = []
    private lazy var mainView = UIView()
    private lazy var topSection = UIView()
    private lazy var topSectionImage = UIImageView(image: UIImage(named: "topSectionBgImage"))
    private lazy var learnMoreButton = UIButton()
    
    private lazy var consultationChatContainer = UIView()
    private lazy var friendsChatContainer = UIView()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        consultChats = [Chat(name: "Dr. May", lastMessage: "Hey, how are you?", avatarImage: "drMayImage", isUnread: true, date: Date()), Chat(name: "Dr. Anderson", lastMessage: "I have sent you results of diasnostic test", avatarImage: "drAndersonImage", isUnread: true, date: Date())]
        
        friendsChats = [Chat(name: "Dr. May", lastMessage: "Hey, how are you?", avatarImage: "drMayImage", isUnread: true, date: Date()), Chat(name: "Dr. Anderson", lastMessage: "I have sent you results of diasnostic test", avatarImage: "drAndersonImage", isUnread: true, date: Date())]
        setupTop()
        setupConsultation()
        setupFriends()
    }
    
    func setupTop(){
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
        
        mainView.addSubview(topSection)
        topSection.snp.makeConstraints{ maker in
            maker.width.equalToSuperview().offset(-32)
            maker.height.equalTo(159)
            maker.top.equalTo(80)
            maker.horizontalEdges.equalTo(16)
            topSection.layer.cornerRadius = 20
        }
        
        topSection.addSubview(topSectionImage)
        topSectionImage.contentMode = .scaleAspectFit
        topSectionImage.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
        
        lazy var label1 = UILabel()
        lazy var label2 = UILabel()
        label1.text = "Chat with therapist"
        label1.font = .systemFont(ofSize: 16, weight: .bold)
        
        topSection.addSubview(label1)
        label1.snp.makeConstraints{ maker in
            maker.width.equalTo(150)
            maker.height.equalTo(20)
            maker.top.equalTo(30)
            maker.left.equalTo(50)
        }
        
        label2.text = "Start your conversation with therapist and improve your mental health with professional support"
        label2.font = .systemFont(ofSize: 12, weight: .medium)
        label2.textColor = .white
        label2.numberOfLines = 3
        topSection.addSubview(label2)
        label2.snp.makeConstraints{ maker in
            maker.width.equalTo(280)
            maker.left.equalTo(label1.snp.left)
            maker.top.equalTo(label1.snp.bottom).offset(5)
        }
        
        lazy var buttonLayer = UIView()
        lazy var buttonTitle = UILabel()
        topSection.addSubview(learnMoreButton)
        learnMoreButton.addSubview(buttonLayer)
        buttonLayer.addSubview(buttonTitle)
        buttonLayer.backgroundColor = .orange
        buttonLayer.layer.cornerRadius = 5
        buttonTitle.text = "Learn more"
        buttonTitle.font = .systemFont(ofSize: 10, weight: .bold)
        buttonTitle.textColor = .white
        learnMoreButton.snp.makeConstraints{ maker in
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.right.equalTo(-50)
            maker.top.equalTo(label2.snp.bottom).offset(20)
        }
        buttonLayer.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
        buttonTitle.snp.makeConstraints{ maker in
            maker.centerX.equalTo(buttonLayer.snp.centerX)
            maker.centerY.equalTo(buttonLayer.snp.centerY)
        }
        
    }
    
    func setupConsultation(){
        mainView.addSubview(consultationChatContainer)
        consultationChatContainer.snp.makeConstraints{ maker in
            maker.height.equalTo(240)
            maker.width.equalTo(335)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(topSection.snp.bottom).offset(10)
        }
        lazy var consultLabel = UILabel()
        consultLabel.text = "Consultation"
        consultLabel.font = .systemFont(ofSize: 24, weight: .bold)
        consultationChatContainer.addSubview(consultLabel)
        consultLabel.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(28)
            maker.top.equalToSuperview()
        }
        lazy var chatStackView = UIStackView()
        chatStackView.axis = .vertical
        chatStackView.spacing = 0
        chatStackView.distribution = .fillProportionally
        consultationChatContainer.addSubview(chatStackView)
        chatStackView.snp.makeConstraints{ maker in
            maker.top.equalTo(consultLabel.snp.bottom).offset(20)
            maker.width.equalToSuperview()
            maker.height.equalTo(192)
        }
        for chat in consultChats{
            let chatView = setupChat(chat: chat)
            chatStackView.addArrangedSubview(chatView)
            chatView.snp.makeConstraints{
                $0.centerX.equalTo(chatStackView.snp.centerX)
            }
        }
    }
    
    func setupFriends(){
        mainView.addSubview(friendsChatContainer)
        friendsChatContainer.snp.makeConstraints{ maker in
            maker.height.equalTo(240)
            maker.width.equalTo(335)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(consultationChatContainer.snp.bottom).offset(10)
        }
        lazy var consultLabel = UILabel()
        consultLabel.text = "Friends"
        consultLabel.font = .systemFont(ofSize: 24, weight: .bold)
        friendsChatContainer.addSubview(consultLabel)
        consultLabel.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(28)
            maker.top.equalToSuperview()
        }
        lazy var chatStackView = UIStackView()
        chatStackView.axis = .vertical
        chatStackView.spacing = 0
        chatStackView.distribution = .fillProportionally
        friendsChatContainer.addSubview(chatStackView)
        chatStackView.snp.makeConstraints{ maker in
            maker.top.equalTo(consultLabel.snp.bottom).offset(20)
            maker.width.equalToSuperview()
            maker.height.equalTo(192)
        }
        for chat in consultChats{
            let chatView = setupChat(chat: chat)
            chatStackView.addArrangedSubview(chatView)
            chatView.snp.makeConstraints{
                $0.centerX.equalTo(chatStackView.snp.centerX)
            }
        }
    }
    
    func setupChat(chat: Chat) -> UIView{
        let chatContainer = UIView()
        chatContainer.snp.makeConstraints{ maker in
            maker.width.equalTo(335)
            maker.height.equalTo(72)
        }
        let avatarContainer = UIView()
        chatContainer.addSubview(avatarContainer)
        avatarContainer.snp.makeConstraints{ maker in
            maker.width.height.equalTo(64)
            avatarContainer.layer.cornerRadius = 64
            maker.leading.equalTo(0)
            
        }
        let avatarImage = UIImageView(image: UIImage(named: chat.avatarImage))
        avatarContainer.addSubview(avatarImage)
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        let infoContainer = UIView()
        chatContainer.addSubview(infoContainer)
        infoContainer.snp.makeConstraints{ maker in
            maker.leading.equalTo(avatarContainer.snp.trailing).offset(10)
            maker.width.equalTo(260)
            maker.height.equalTo(72)
        }
        let nameLabel = UILabel()
        nameLabel.text = chat.name
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        infoContainer.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{ maker in
            maker.width.equalTo(200)
            maker.height.equalTo(20)
            maker.bottom.equalTo(infoContainer.snp.centerY).offset(-5)
            maker.left.equalTo(0)
        }
        let messageLabel = UILabel()
        messageLabel.text = chat.lastMessage
        messageLabel.font = .systemFont(ofSize: 12, weight: .bold)
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 1
        infoContainer.addSubview(messageLabel)
        messageLabel.snp.makeConstraints{ maker in
            maker.width.equalTo(200)
            maker.height.equalTo(15)
            maker.top.equalTo(infoContainer.snp.centerY)
            maker.left.equalTo(0)
        }
        let dateLabel = UILabel()
        dateLabel.text = " \(Calendar.current.component(.day, from: chat.date)).\(Calendar.current.component(.month, from: chat.date))"
        chatContainer.addSubview(dateLabel)
        dateLabel.font = .systemFont(ofSize: 10, weight: .bold)
        dateLabel.textColor = .gray
        dateLabel.snp.makeConstraints{ maker in
            maker.height.equalTo(25)
            maker.width.equalTo(50)
            maker.top.equalTo(0)
            maker.right.equalTo(0)
        }
        
        if(chat.isUnread){
            let unreadView = UIView()
            unreadView.backgroundColor = UIColor(red: 1, green: 7, blue: 144, alpha: 0.7)
            chatContainer.addSubview(unreadView)
            unreadView.snp.makeConstraints{ maker in
                maker.width.height.equalTo(16)
                maker.centerY.equalTo(chatContainer.snp.centerY)
                maker.right.equalTo(5)
            }
            unreadView.layer.cornerRadius = 15
        }
        return chatContainer
    }
    
    func createDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = UIColor.black
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return divider
    }
    

}
