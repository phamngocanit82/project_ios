import UIKit
extension UIFont {
    func changeFont(_ control: AnyObject) {
        if (control is UILabel) {
            let lbl: UILabel? = (control as? UILabel)
            lbl?.font = UIFont(name: fontName, size: (lbl?.font.pointSize)!)
            //lbl?.font = lbl?.font.boldItalic
            return
        }
        if (control is UIButton) {
            let btn: UIButton? = (control as? UIButton)
            btn?.titleLabel?.font = UIFont(name: fontName, size: (btn?.titleLabel?.font.pointSize)!)
            return
        }
        if (control is UITextField) {
            let txt: UITextField? = (control as? UITextField)
            txt?.textColor = UIColor(red: CGFloat(198 / 255.0), green: CGFloat(160 / 255.0), blue: CGFloat(64 / 255.0), alpha: CGFloat(1))
            return
        }
        if (control is UITextView) {
            let txt: UITextView? = (control as? UITextView)
            txt?.textColor = UIColor(red: CGFloat(198 / 255.0), green: CGFloat(160 / 255.0), blue: CGFloat(64 / 255.0), alpha: CGFloat(1))
            return
        }
        for ctr in control.subviews{
            changeFont(ctr)
        }
    }
    var fontName: String {
        return "arial"
    }
    
    var bold: UIFont {
        return with(traits: .traitBold)
    }
    
    var italic: UIFont {
        return with(traits: .traitItalic)
    }
    var boldItalic: UIFont {
        return with(traits: [.traitBold, .traitItalic])
    }

    func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}
