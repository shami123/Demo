

import UIKit

class RegistrationVM: NSObject {

    lazy var businessManager :BusinessManager = {
        return BusinessManager()
    }()
    
    var isStatus : Bool?
    var msg : String?
    var reloadData: (()->())?
    var message : String?
    func registerAPI(info:[String:Any]){
        
        businessManager.apiClient(indicator:true, dict: info as [String : Any], endpoint: APIMethodName.register , method:APIMETHODTYPE.POST, type: .register) { (status, msg, error) in
            if  status == true
            {
                self.isStatus = status
                self.message = msg as? String ?? ""
                let msg = UIApplication.shared.keyWindow?.rootViewController?.view
                Helper.showError(self.message ?? "Error", ((msg ?? nil)!))
                self.reloadData?()
            }
            else
            {
                self.message = msg as? String
                let msg = UIApplication.shared.keyWindow?.rootViewController?.view
              

            }
            
        }
    }
    }
    

