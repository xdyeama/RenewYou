//
//  JournalEditorViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 20.12.2023.
//

import UIKit
import SnapKit

class JournalEditorViewController: UIViewController{
    var isTemplate: Bool = false
    var topic: String = ""
    var cb: ((UserJournal) -> Void)?
    private let userJournals: [UserJournal] = []
    private let mainView = UIView()
    private var titleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = "Untitled"
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false // Disable scrolling
        textView.font = .systemFont(ofSize: 24, weight: .bold)
        return textView
    }()
    private var mainTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = "Start writing..."
        textView.isEditable = true
        textView.textColor = .gray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false // Disable scrolling
        textView.font = .systemFont(ofSize: 16, weight: .regular)
        return textView
    }()
    private var topicTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = ""
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.isScrollEnabled = false // Disable scrolling
        textView.font = .systemFont(ofSize: 24, weight: .bold)
        return textView
    }()
    private var postButton: UIButton = {
        let button = UIButton()

        button.backgroundColor = .black
        button.layer.cornerRadius = 35
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.mainView)
        self.titleTextView.delegate = self
        self.mainTextView.delegate = self
        self.topicTextView.text = topic
        setupUI()
    }
    
    func setupUI(){
        if !isTemplate{
            self.view.addSubview(self.titleTextView)
            self.titleTextView.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-32)
                make.height.equalTo(90)
                make.top.equalTo(50)
                make.centerX.equalToSuperview()
            }
            self.view.addSubview(self.mainTextView)
            self.mainTextView.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-32)
                make.height.equalTo(25)
                make.top.equalTo(self.titleTextView.snp.bottom)
                    .offset(5)
                make.centerX.equalToSuperview()
            }
        }else{
                self.view.addSubview(self.topicTextView)
            self.topicTextView.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-32)
                make.height.equalTo(100)
                make.top.equalTo(30)
                make.centerX.equalToSuperview()
            }
            self.view.addSubview(self.mainTextView)
            self.mainTextView.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-32)
                make.height.equalTo(300)
                make.top.equalTo(self.topicTextView.snp.bottom)
                        .offset(15)
                make.centerX.equalToSuperview()
            }
        }
        self.view.addSubview(self.postButton)
        self.postButton.translatesAutoresizingMaskIntoConstraints = false
        self.postButton.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.bottom.right.equalTo(-20)
        }
        let checkmarkImage = UIImageView(image: UIImage(systemName: "checkmark"))
        checkmarkImage.contentMode = .scaleAspectFit
        checkmarkImage.tintColor = .white
        self.postButton.addSubview(checkmarkImage)
        checkmarkImage.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.edges.equalTo(10)
        }
    }
    
}

extension JournalEditorViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Start writing...",textView.text == "Untitled" {
                textView.text = ""
                textView.textColor = UIColor.black
            }
        }
}
