

import Foundation
import UIKit

enum Urls:String {
    case Development = ""
    
//    case Production = ""
}
public let APNSToken    = "APNSToken"

struct Loader {
    static let loading = "Loading..."
}
func findApiUrl(bundle_id: String) -> Urls {
    
    return Urls.Development
}
struct Color
{
    static let parrotColor = UIColor.init(red: 77.0/255.0, green: 232.0/255.0, blue: 66.0/255.0, alpha: 1)
    static let greenColor = UIColor.init(red: 42.0/255.0, green: 158.0/255.0, blue: 36.0/255.0, alpha: 1)

}
struct RegistrationData {
    static let country : String = "country"
    static let user_id  = "user_id"
    static let loginEmail : String = "loginEmail"
    static let token : String = "token"
    static let authenticationkey : String = "authenticationkey"
    static let profile_status : String = "profile_status"
    static let firstName : String = "firstName"
    static let lastName : String  = "lastName"
    static let dob : String = "dob"
    static let dd : String = "dd"
    static let mm : String = "mm"
    static let yyyy : String = "yyyy"
    static let fullName : String  = "fullName"
    static let email : String = "email"
    static let address : String = "address"
    static let street : String = "street"
    static let houseNumber : String = "houseNumber"
    static let postCode : String = "postCode"
    static let city : String = "city"
    static let mobileNumber : String = "mobileNumber"
    static let password : String = "password"
    static let promotionalInviteCode : String = "promotionalInviteCode"
    static let industry : String = "industry"
    static let occupation : String = "occupation"
    static let gender : String = "gender"
    static let cityOfBirth : String = "cityOfBirth"
    static let citizenShip : String = "citizenShip"
    static let checkCountryTax : String = "checkCountryTax"
    static let termAccept :  String = "termAccept"
    static let fullDOB :  String = "fullDOB"
    static let areaCode :  String = "areaCode"
    static let mobileCode :  String = "mobileCode"
    static let taxId :  String = "taxId"
    static let taxCountry :  String = "taxCountry"
    static let proof_id : String = "proof_id"
    static let proof_address  : String = "proof_address"
     static let selfi_with_passport  : String = "selfi_with_passport"
   static let  btc_balance : String = "btc_balance"
  static let  qrcode_email : String = "qrcode_email"
    static let  faq : String = "faq"
    static let  support : String = "support"

}

struct API {
    static let BUNDLE_ID: String = Bundle.main.bundleIdentifier!
    static let BASEURL = findApiUrl(bundle_id: BUNDLE_ID).rawValue
}

struct APIRESPONSECODE {
    static var BADREQUEST = 400
    static var DATANOTFOUND = 900
    static var SUCCESS = 200
    static var VERIFYEMAIL = 600
    static var EMAILEXIST = 500
    static var INCORRECTOLDPWD = 700
    static var USERNOTEXIST = 910
    static var NOTUPGRADESUBSCRIPTION = 500
}
enum APIMETHODTYPE {
    static var POST:String = "POST"
    static var GET:String = "GET"
    static var PATCH:String = "PATCH"
    static var DELETE:String = "DELETE"
    static var PUT:String = "PUT"
    
}


enum APIMethodName {
    static let register = "register"
    
}
struct  Globals {
    static var defaults = UserDefaults.standard
    //Notifications
    static var notificationInfo : [AnyHashable : Any]?
    //Headers
    static var headers : [String: String]!
    static var userProfilePic:UIImage? = nil
    static var userProfilePicUrl:URL? = nil
    static var profilePlaceholder = UIImage(named: "avatar")
    mutating func updateAuthHeaders(){
        Globals.headers = ["Authorization":  "FB_JWT "+((Globals.defaults.object(forKey: "authToken")  ?? "") as! String) ]

    }
    //Variables
    static var testCode:Int = 401
    
    func getToken()->String{
        return ((Globals.defaults.object(forKey: "authToken")  ?? "") as! String)
    }
    
}
enum appScheme {
    static  let blueColor = UIColor(red: 118/255.0, green: 195/255.0, blue: 229/255.0, alpha: 1.0)
    static  let redColor = UIColor(red: 211/255.0, green: 31/255.0, blue: 71/255.0, alpha: 1.0)
    static var appColor = redColor
    static var appDashBoardColor = redColor
    static let lightGraySeparatorColor = UIColor.init(red: 232.0/255.0, green: 232.0/255.0, blue: 232.0/255.0, alpha: 1)
    static let whiteColor = UIColor.white
    static let sendMsgBubbleColor = UIColor.init(red: 196.0/255.0, green: 196.0/255.0, blue: 196.0/255.0, alpha: 1)
    static let lightGray = UIColor.init(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
    static let darkGray = UIColor.init(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1)
    static let darkGreen = UIColor.init(red: 25.0/255.0, green: 165.0/255.0, blue: 96.0/255.0, alpha: 1)
    static let loginBorderColor  = UIColor.init(red: 245.0/255.0, green: 25.0/255.0, blue: 70.0/255.0, alpha: 1)
    static let tabbarColor  = UIColor.init(red: 196.0/255.0, green: 196.0/255.0, blue: 196.0/255.0, alpha: 1)
    static let selectedTabbar  = UIColor.init(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1)
    static let lineLightGrayColor  = UIColor.init(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1)
    static let noSelectedColor  = UIColor.init(red: 183.0/255.0, green: 183.0/255.0, blue: 183.0/255.0, alpha: 1)
    static let inboxLightGrayColor  = UIColor.init(red: 0.29, green: 0.29, blue: 0.29, alpha: 1)
    static let inboxGrayColor  = UIColor.init(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)
    static let errorColor = UIColor.init(red: 244/255.0, green: 67/255.0, blue: 54/255.0, alpha: 1)
    static let darktext = UIColor.darkText
    static let lighttext = UIColor.lightText
    static let lightGrayColor = UIColor.init(red: 196.0/255.0, green: 196.0/255.0, blue: 196.0/255.0, alpha: 1)
    static let lightGrayDisabledColor = UIColor.init(red: 0.77, green: 0.77, blue: 0.77, alpha: 1)
    static let lightGrayInfoColor = UIColor.init(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
    static let smallSize : CGFloat = 14.0
    static let mediumSize : CGFloat = 16.0
    static let largeSize : CGFloat = 18.0
    static let tinySize : CGFloat = 12.0
    static let appVersion_v2 = "2"
    static let appVersion_v1 = "1"
    
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
}

enum AppStoryboard : String {
    case Main = "Main"
    case Registration = "Registration"
    case Timeline = "Timeline"
    case MyWallet = "Wallet"
    case Profile = "Profile"
    case BuySell = "BuySell"

    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}
enum dateFormates {
    static let HH_mm = "HH:mm"
    static let mm_dd_yyyy = "MM:dd:yyyy"
    static let yyyy_MM_dd = "yyyy-MM-dd"
    static let mm_dd_yyyy_hh_mm = "MM:dd:yyyy HH:mm"
    static let dd_mm_yyyy_hh_mm = "dd:MM:yyyy HH:mm"
    static let dd_m_yyyy = "dd.MM.yyyy"
    static let dd_m_yyyy_hh_mm = "dd:mm:yyyy HH:mm"
    static let dayName = "EE"
    static let yearName = "yyyy"
    static let Hour = "HH"
    static let minute = "mm"
    static let fullMonthName = "MMMM"
    static let dd_mm = "dd. MMM"
    static let date = "dd"
    static let dd_mm_yyyy = "dd.MM.yyyy"
    static let yyyy = "yyyy"
    static let yyyy_MM_dd_T_HH_mm_ssZZZZZ =  "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    static let dd_MM_yyyy_HH_mm = "dd/MMM/yyyy, HH:mm a"
}

enum dateFormatesWithMiddleDot {
    static let HH_mm = "HH.mm"
    static let hh_mm = "HH:mm"
    static let mm_dd_yyyy = "MM.dd.yyyy"
}
enum PasswordStrength : String {
    case very_weak = "Very Weak"
    case weak = "Weak"
    case reasonable = "Reasonable"
    case strong = "Strong"
}
struct DEVICES {
    enum enDeviceFamily:Int {
        case iPhone4S
        case iPhone5Family
        case iPhone6
        case iPhone6Plus
        case iPhone4
        case iPhoneX
    }
    static var DEVICE : enDeviceFamily = enDeviceFamily.iPhone6Plus
}
enum Messages {
    static var KNoTitle: String { get { return NSLocalizedString("Please fill the title", comment: "") }}

   static var KOk: String { get { return NSLocalizedString("ok", comment: "") }}
    static var KNoDescription: String { get { return NSLocalizedString("Please fill the description", comment: "") }}
   static var KNetworkError : String { get { return NSLocalizedString("Network Error", comment: "") }}
    static var KInvalidEmail: String { get { return NSLocalizedString("Enter valid email ", comment: "")} }
    static var KInvalidRetype: String { get { return NSLocalizedString("Retype password is not same", comment: "")} }

    static var KActivationEmailSent: String {get {return NSLocalizedString("ActivationEmailSent", comment: "")}}
        static var InvalidUser: String { get { return NSLocalizedString("User not valid",comment: "") } }
        static var KInvalidText: String { get { return NSLocalizedString("Enter all fields",comment: "") } }
        static var KInvalidPassword: String { get { return NSLocalizedString("Enter password",comment: "") } }
        static var KErrorTitle: String { get { return NSLocalizedString("Error",comment: "") }}
    static var KPermissionDenied: String { get { return NSLocalizedString("Permission denied", comment: "") } }
    
}
