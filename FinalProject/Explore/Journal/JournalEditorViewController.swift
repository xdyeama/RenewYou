//
//  JournalEditorViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 20.12.2023.
//

import UIKit

class JournalEditorViewController: UIViewController, UITextViewDelegate {
    var isTemplate: Bool = false
    var topic: String = ""
    private var titleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Untitled"
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false // Disable scrolling
        textView.font = .systemFont(ofSize: 16, weight: .bold)
        return textView
    }()
    private var mainTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Start writing..."
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false // Disable scrolling
        textView.font = .systemFont(ofSize: 16, weight: .bold)
        return textView
    }()
    private var topicTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Untitled"
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false // Disable scrolling
        textView.font = .systemFont(ofSize: 16, weight: .bold)
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
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
                make.height.equalTo(25)
                make.top.equalTo(30)
                make.centerX.equalToSuperview()
            }
            self.view.addSubview(self.mainTextView)
            self.mainTextView.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-32)
                make.height.equalTo(15)
                make.top.equalTo(self.titleTextView.snp.bottom)
                    .offset(15)
                make.centerX.equalToSuperview()
            }
        }else{
                self.view.addSubview(self.topicTextView)
            self.topicTextView.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-32)
                make.height.equalTo(25)
                make.top.equalTo(30)
                make.centerX.equalToSuperview()
            }
            self.view.addSubview(self.mainTextView)
            self.mainTextView.snp.makeConstraints { make in
                make.width.equalToSuperview().offset(-32)
                make.height.equalTo(15)
                make.top.equalTo(self.titleTextView.snp.bottom)
                        .offset(15)
                make.centerX.equalToSuperview()
            }
        }
    }
    
}

extension JournalEditorViewController{
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame

    }
}
