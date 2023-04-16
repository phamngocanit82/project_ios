import Foundation
struct UtilsLog {
    static public func log(_ message: Any) {
        if Global.SHOW_LOG {
            print("\(message)")
        }
    }
    static public func log(_ object: Any, _ message: Any) {
        if Global.SHOW_LOG {
            print("\(object) \(message)")
        }
    }
    static public func log(_ object: Any, _ strCaption: String, _ message: Any) {
        if Global.SHOW_LOG {
            print("\(String(describing: type(of: object))) \(strCaption) \(message)")
        }
    }
}
