//
//  ViewController.swift
//  project_ios
//
//  Created by An on 30/12/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        utilsLog.log("platformString", UIDevice.current.platformString)
        utilsLog.log("SCREEN_WIDTH", ScreenSize.SCREEN_WIDTH)
        utilsLog.log("IS_IPHONE", Device.IS_IPHONE)
        utilsLog.log("fontName", UIFont().fontName)
        if let window = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.windows.first {
            let view = window.rootViewController?.view
            UIFont().changeFont(view!)
        }
        utilsLog.log("topMostViewController \(String(describing: UIApplication.shared.topMostViewController()))")
        
        let aesEncrypt = "pham ngoc an".aesEncrypt(key: "abcdef", iv: "123gh")
        utilsLog.log("aesEncrypt", aesEncrypt!)
        let aesDecrypt = aesEncrypt?.aesDecrypt(key: "abcdef", iv: "123gh")
        utilsLog.log("aesDecrypt", aesDecrypt!)
    }


}

