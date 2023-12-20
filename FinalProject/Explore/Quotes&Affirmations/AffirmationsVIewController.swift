//
//  AffirmationsVIewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 20.12.2023.
//

import UIKit

class AffirmationsViewController: UIViewController {
    private var quotesArray: [Quote] = []
    private let imageBackground = UIImageView(image: UIImage(named: "mountains"))
    private let customNavbar = CustomNavbar(with: "")
    private let quotesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 700
        tableView.estimatedRowHeight = 700
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.identifier)
        
        return tableView
    }()
    
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.quotesArray = quotesData
        self.setupDelegates()
        self.setupUI()
        self.configureTableView()
        self.setupNavbar()
        
        self.startAutoScrollTimer()
        
    }
    
    func setupDelegates(){
        self.quotesTableView.delegate = self
        self.quotesTableView.dataSource = self
    }
    
    
    func setupUI(){
        self.view.addSubview(self.imageBackground)
        self.imageBackground.translatesAutoresizingMaskIntoConstraints = false
        self.imageBackground.contentMode = .scaleToFill
        self.imageBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview().offset(100)
        }
    }
    
    private func configureTableView(){
        self.imageBackground.addSubview(self.quotesTableView)
        self.quotesTableView.translatesAutoresizingMaskIntoConstraints = false
        self.quotesTableView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
    }
        
    func setupNavbar(){
            self.imageBackground.addSubview(self.customNavbar)
            self.customNavbar.translatesAutoresizingMaskIntoConstraints = false
        self.customNavbar.backgroundColor = .clear
            self.customNavbar.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(25)
                make.top.equalTo(60)
            }
    }
    
    func startAutoScrollTimer() {
          timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    
    @objc func autoScroll() {
            // Scroll to the next row
            let visibleIndexPaths = quotesTableView.indexPathsForVisibleRows ?? []
            if let lastVisibleIndexPath = visibleIndexPaths.last,
               lastVisibleIndexPath.row < self.quotesArray.count - 1 {
                let nextIndexPath = IndexPath(row: lastVisibleIndexPath.row + 1, section: lastVisibleIndexPath.section)
                quotesTableView.scrollToRow(at: nextIndexPath, at: .top, animated: true)
            } else {
                // Scroll to the first row if currently at the last row
                let firstIndexPath = IndexPath(row: 0, section: 0)
                quotesTableView.scrollToRow(at: firstIndexPath, at: .top, animated: true)
            }
        }

    deinit {
            timer?.invalidate()
        }

}


extension AffirmationsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quotesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.identifier, for: indexPath) as? QuoteTableViewCell else { fatalError("could not dequeue cell")}
                
        let quote = self.quotesArray[indexPath.row].text
        let author = self.quotesArray[indexPath.row].author
        
        cell.configure(quote: quote, author: author)
                
        return cell
    }
    
    
}
