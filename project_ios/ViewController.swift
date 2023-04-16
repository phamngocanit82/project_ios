//
//  ViewController.swift
//  project_ios
//
//  Created by An Pham Ngoc on 4/9/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UtilsLog.log("platformString", UIDevice.current.platformString)
        UtilsLog.log("SCREEN_WIDTH", ScreenSize.SCREEN_WIDTH)
        UtilsLog.log("IS_IPHONE", Device.IS_IPHONE)
        UtilsLog.log("fontName", UIFont().fontName)
        if let window = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.windows.first {
            let view = window.rootViewController?.view
            UIFont().changeFont(view!)
        }
        UtilsLog.log("topMostViewController \(String(describing: UIApplication.shared.topMostViewController()))")
        
        let aesEncrypt = "pham ngoc an".aesEncrypt(key: "abcdef", iv: "123gh")
        UtilsLog.log("aesEncrypt", aesEncrypt!)
        let aesDecrypt = aesEncrypt?.aesDecrypt(key: "abcdef", iv: "123gh")
        UtilsLog.log("aesDecrypt", aesDecrypt!)
    }


}

