//
//  ViewController.swift
//  TipsDemo
//
//  Created by evc_admin on 2019/12/5.
//  Copyright © 2019 huxq-coder. All rights reserved.
//

import UIKit

class TipsDemoMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view1.backgroundColor = UIColor.red
        self.view.addSubview(view1)
        
        
        let image = self.view .viewToImage()
        print("view to image\(image)")
        
    }

}

/// UIView 扩展方法，view转换为图片
extension UIView {
    func viewToImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(frame.size)
            layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
}

