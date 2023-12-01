//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 25.11.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
//    var topView: UIView = UIView()
//    var bgImage: UIImageView = UIImageView(image: UIImage(named: "topViewBg"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        layoutSubviews()
    
        self.view.backgroundColor = .systemGreen
        
        var label = UILabel()
        
//        label.snp.makeConstraints{ view in
//            view.centerX.equalTo(150)
//            view.centerY.equalTo(400)
//
//            view.width.equalTo(200)
//            view.height.equalTo(100)
//        }
        
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Home"
        
        self.view.addSubview(label)
    }
    
//    func layoutSubviews(){
//
//        topView.snp.makeConstraints{ view in
//            view.top.equalTo(0)
//            view.right.equalTo(2)
//            view.left.equalTo(2)
//
//            view.height.equalTo(282)
//            view.width.equalTo(377)
//        }
//
//
//        self.view.addSubview(topView)
//        topView.addSubview(bgImage)
//
//        bgImage.contentMode = .scaleAspectFill
//
//        bgImage.snp.makeConstraints{ view in
//            view.edges.equalToSuperview()
//        }
//    }


}
