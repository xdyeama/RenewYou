//
//  JournalingViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 14.12.2023.
//

import UIKit

class JournalingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.text = "Journaling"
        self.view.addSubview(label)
        label.snp.makeConstraints{ maker in
            maker.width.equalTo(100)
            maker.height.equalTo(40)
            maker.centerX.equalTo(self.view.snp.centerX)
            maker.centerY.equalTo(self.view.snp.centerY)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
