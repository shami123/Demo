//
//  Helper.swift


import UIKit
import SafariServices
import Toast
import CoreData
//import SwiftyPlistManager
class Helper: NSObject {
    class func getMainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
  
    static func mediumFont(fontSize: CGFloat) -> UIFont {
        return UIFont(name:"SFProText-Medium" , size: fontSize)!
    }
    static func boldFont(fontSize: CGFloat) -> UIFont {
        return UIFont(name:"SFProText-Bold" , size: fontSize)!
    }
    static func semiBoldFont(fontSize: CGFloat) -> UIFont {
        return UIFont(name:"SFProText-Semibold" , size: fontSize)!
    }
    
    static func regularItalic(fontSize: CGFloat) -> UIFont {
        return UIFont(name:"SFProText-Italic" , size: fontSize)!
    }
    
    static func regularFont(fontSize: CGFloat) -> UIFont {
        return UIFont(name:"SFProText-Regular" , size: fontSize)!
    }
  
    class func heightForCell(text:String, font:UIFont, frame:CGRect) -> CGFloat{
        let label:UILabel = UILabel(frame: frame)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    class func getDeviceModel() -> DEVICES.enDeviceFamily
    {
        var screenHeight: CGFloat!
        screenHeight = UIScreen.main.bounds.size.height
        if screenHeight > 480 && screenHeight < 667 { //iphone5 family
            return DEVICES.enDeviceFamily.iPhone5Family
        }
        else if  screenHeight > 480 && screenHeight < 736 { //iPhone6
            return DEVICES.enDeviceFamily.iPhone6
        }
        else if ( screenHeight >= 812 ) { // iPhoneX
            return DEVICES.enDeviceFamily.iPhoneX
        }
        else if ( screenHeight > 480 ) { // iPhone6Plus
            return DEVICES.enDeviceFamily.iPhone6Plus
        }
            
        else if ( screenHeight == 480 ) { // iPhone4
            return DEVICES.enDeviceFamily.iPhone4S
        }
       
        return DEVICES.enDeviceFamily.iPhone5Family
    }
    
    class func removeCharacterFromPhone(phoneNumber : String) -> String
    {
        let charsToRemove: Set<Character> = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ()+-")
        let newNumberCharacters = String(phoneNumber.filter { !charsToRemove.contains($0) })
        print(newNumberCharacters)
        return newNumberCharacters


    }
    
 
    
    
    class func showError(_ message : String , _ view : UIView)
    {
        var style = ToastStyle()
        
        // this is just one of many style options
        style.messageColor = .white
        style.backgroundColor = .orange
        // present the toast with the new style
        view.makeToast(message, duration: 3.0, position: .top, style: style)
        
        // or perhaps you want to use this style for all toasts going forward?
        // just set the shared style and there's no need to provide the style again
//        ToastManager.shared.style = style
//        view.makeToast("This is a piece of toast") // now uses the shared style
        
        // toggle "tap to dismiss" functionality
        ToastManager.shared.isTapToDismissEnabled = true
        
        // toggle queueing behavior
        ToastManager.shared.isQueueEnabled = true
    }
    
    class func showAlertWithItemAction(sender: UIViewController, title: String, message: String, buttonTitles : [String], completion: ((_ buttonPressed: String) -> Void)?) {
        DispatchQueue.main.async  {
            
            let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            
            for buttonTitle in buttonTitles {
                alertView.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: {
                    (action : UIAlertAction) -> Void in
                    completion!(action.title!)
                }))
            }
            sender.present(alertView, animated: true, completion: nil)
        }
    }
    
    
    class func buttomBorder(item:Any?)->UIView?{
        let layer = CALayer()
        if let view = item as? UIView {
            layer.frame = CGRect(x: 0, y: Int(view.frame.size.height) - 2, width: Int(view.frame.size.width), height: 1)
            layer.backgroundColor = UIColor.darkGray.cgColor
            view.layer.addSublayer(layer)
            return view
        }
        return item as? UIView
    }
   
    class func getBase64StringOfImage(_ image:UIImage) -> String {
        let imageData = image.jpegData(compressionQuality: 0.75)
        let imageBase64  = (imageData?.base64EncodedString(options: .lineLength64Characters))!
        return imageBase64
    }
    class func showToast(message: String, seconds: Double) {
       
       let  vc =  UIViewController()
      let alert = UIAlertController(title: nil, message: message,
        preferredStyle: .alert)
      alert.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
     
      alert.view.layer.cornerRadius = 15
       vc.present(alert, animated: true)
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
          do {
              alert.dismiss(animated: true)
          }
      })
        
      
    }

   class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
extension String {
    public func isValidEmail() -> Bool {
        let stricterFilterString : String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest : NSPredicate = NSPredicate(format: "SELF MATCHES %@", stricterFilterString)
        return emailTest.evaluate(with: self)
    }
}
