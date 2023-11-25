//
//  CustomTabbar.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 23.11.2023.
//

import UIKit
import SnapKit

class CustomTabbar: UITabBar {
    @IBInspectable var color: UIColor?
    @IBInspectable var radius: CGFloat = 18
    @IBInspectable var contentColor: CGColor = CGColor(red: 160, green: 160, blue: 160, alpha: 1)
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape(){
        
        var shapeLayer: CAShapeLayer{
            let view = CAShapeLayer()
            
            view.path = createPath()
            view.strokeColor = contentColor
            
            view.fillColor = color?.cgColor ?? UIColor.black.cgColor
            view.lineWidth = 1
            view.shadowColor = contentColor
            view.shadowOffset = CGSize(width: 0, height: -2);
            view.shadowOpacity = 0.21
            view.shadowRadius = 8
            view.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
            
            return view
        }
        
        if let oldShapeLayer = self.shapeLayer{
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        }else{
            layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath{
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radius, height: 0.0)
        )
        
        return path.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        
        var tabFrame: CGRect{
            var frame = self.frame
            
            frame.size.height = 65 + window!.safeAreaInsets.bottom
            frame.origin.y = self.frame.origin.y + self.frame.height - 65 - window!.safeAreaInsets.bottom
            
            self.layer.cornerRadius = 18
            
            return frame
        }
        
        self.frame = tabFrame
        
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0)})
    }
    
//    func addTabBarIndicatorView(index: Int, isFirstTime: Bool = false){
//        guard let tabView = tabBar.items?[index].value(forKey: "view") as UIView else{
//            return
//        }
//
//        var upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + itemSpacing, y: tabView.frame.minY + 0.1, width: tabView.size.width + itemSpacing - 2, height: 4))
//
//        upperLineView.backgroundColor = UIColor.black
//
//        tabBar.addSubview(upperLineView)
//
//        if !isFirstTime{
//            upperLineView.removeFromSuperview()
//        }
//    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
