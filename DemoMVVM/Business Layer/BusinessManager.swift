//
//  BusinessManager.swift


import Foundation
import UIKit


public enum ResponseStatus:Int {
    case tokenExpired = 203
   // case InvalidToken = 202
    case networkNotAvailable = 204
    case unknownError = 205
    case RequestLogin = 201
    case failed  = 400
    case InvalidToken  = 401
    case success = 200
}

enum RequestType: Int{
    case register
}

class BusinessManager : NSObject  {
    var rType = Int()
    var commMgr:CommunicationManager
    
    override init() {
        commMgr = CommunicationManager()
    }
    

    
    var completionAPIBlock: (( _ success: Bool, _ userInfo: Any, _ error: Any? ) -> Void)?
    
    func apiClient(indicator: Bool, dict: [String: Any]?, endpoint:String, method: String, type: RequestType,
                   completion: @escaping ( _ success: Bool, _ resultModel: Any?, _ error: Any? ) -> Void) {
        
        print("dict---\(dict)")
        rType = type.rawValue
                let url : String! = CommunicationManager.baseUrl()+endpoint
        print("url isss--------\(url ?? "")")
        completionAPIBlock = completion
        
        CommunicationManager.callWebService(indicator: indicator, methodType: method, methodName: endpoint, inputDict: dict,
                                            completion: { (result) -> Void in
                                                DispatchQueue.main.async(execute: {
//                                                    SVProgressHUD.dismiss()
                                                    let statusCode = (result as? (result:Any, statusCode:Int))?.statusCode
                                                    if statusCode == ResponseStatus.failed.rawValue{
                                                        self.completionAPIBlock!(false, result, statusCode)
                                                        return
                                                    }
                                                   
                                                    
                                                    switch type {
                                                     
                                                        
                                                        
                                                    case RequestType.register:
                                                        
                                                        
                                                        if let dicdata = result as? [String: Any]{
                                                            let status = dicdata["status"] as? Bool
                                                            if status == true
                                                            {
                                                            let message = dicdata["msg"] as? String;
                                                                self.completionAPIBlock!(true,message as Any,nil)
                                                            }
                                                            else
                                                            {
                                                                let message = dicdata["message"] as? String;
                                                                self.completionAPIBlock!(false,message as Any,nil)
                                                            
                                                            }
                                                        }
                                                                             
                                                    }
                                                })
        })
        {
            (failurMSG) -> Void in
            print(failurMSG)
            
            
            self.completionAPIBlock!(false,failurMSG, failurMSG)
//            if type ==  RequestType.login
//            {
//                self.completionAPIBlock!(true,"", failurMSG)
//            }
        }
    }
   
      
    
    
}


