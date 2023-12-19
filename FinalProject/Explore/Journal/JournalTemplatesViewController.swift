//
//  JournalTemplatesViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit





class JournalTemplatesViewController: UIViewController {
    var category: String = ""
    var journalTemplates: [JournalTemplate] = []
    
    private let mainView = UIScrollView()
    private let contentView = UIView()
    private let customNavbar = CustomNavbar(with: "")
    
    private var headerView: TemplateViewHeader? = nil
    private let templatesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(JournalTemplateViewCell.self, forCellWithReuseIdentifier: JournalTemplateViewCell.identifier)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()

        self.view.addSubview(mainView)
        self.headerView = TemplateViewHeader(image: category, title: category)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(customView: customNavbar.backButton)
        self.templatesCollectionView.delegate = self
        self.templatesCollectionView.dataSource = self
        setupUI()

    }
    
    func setupNavbar(){
        self.view.addSubview(self.customNavbar)
        self.customNavbar.translatesAutoresizingMaskIntoConstraints = false
        self.customNavbar.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 0.96)
        
        self.customNavbar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(25)
            make.top.equalTo(60)
        }
    }
    
    func setupUI(){
        self.mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.top.equalTo(self.customNavbar.snp.bottom)
        }
        self.mainView.addSubview(self.contentView)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1000)
        }
        guard let headerView = self.headerView else { return }
        
        
        self.mainView.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.width.equalTo(250)
            make.height.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        self.mainView.addSubview(templatesCollectionView)
        self.templatesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.templatesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.headerView!.snp.bottom).offset(50)
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(self.contentView.snp.height)
            make.centerX.equalToSuperview()
        }
    }
    
}



extension JournalTemplatesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.journalTemplates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JournalTemplateViewCell.identifier, for: indexPath) as? JournalTemplateViewCell else { fatalError("Failed to dequeue JournalTemplateViewCell in JounalTemplatesViewController") }
        let image = self.journalTemplates[indexPath.row].image
        let title = self.journalTemplates[indexPath.row].title
        let subTitle = self.journalTemplates[indexPath.row].subtitle
        cell.configure(image: UIImage(named: image)!, title: title, subTitle: subTitle)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = BottomSheetViewController()
        detailVC.journal = self.journalTemplates[indexPath.row]
        let nav = UINavigationController(rootViewController: detailVC)
        nav.modalPresentationStyle = .pageSheet
        
        if let sheet = nav.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        
        present(nav, animated: true, completion: nil)
    }
    
    
}


extension JournalTemplatesViewController:  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 250)
    }
}
