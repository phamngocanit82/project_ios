//
//  utilsLog.swift
//  project_ios
//
//  Created by An on 01/01/2023.
//

import Foundation
struct utilsLog {
    static public func log(_ message: Any) {
        if Global.SHOW_LOG {
            print("\(message)")
        }
    }
    static public func log(_ object: Any, _ message: Any) {
        if Global.SHOW_LOG {
            print("\(String(describing: type(of: object))) \(message)")
        }
    }
    static public func log(_ object: Any, _ strCaption: String, _ message: Any) {
        if Global.SHOW_LOG {
            print("\(String(describing: type(of: object))) \(strCaption) \(message)")
        }
    }
}
