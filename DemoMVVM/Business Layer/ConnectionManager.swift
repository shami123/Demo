//
//  ConnectionManager.swift


import Foundation
import UIKit
//import FirebaseInstanceID
//import FirebaseAuth

class CommunicationManager: NSObject{
    class func baseUrl() -> String {
        return CommunicationManager.domain()
    }
    class func domain() -> String {
        return "google.com"
    }
   
    class func callWebService(indicator showLoader: Bool,
                              methodType: String, methodName: String, inputDict: [String: Any]?,
                              completion: @escaping (_ result: Any) -> Void,
                              failure:@escaping (_ failurMSG: String) -> Void){

        if !Internet.isAvailable() {
            
            //END TASK _ FAILURE
//             SVProgressHUD.dismiss()
//            failure(Messages.KNetworkError)
        
        }
    
        do {
           
//            if showLoader {
//                SVProgressHUD.show(withStatus: Loader.loading)
//                SVProgressHUD.setDefaultMaskType(.clear)
//            }
            
          
            //create request
            let tmpString: String = self.baseUrl()+methodName
            
            let  urlString :String = tmpString.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            var data: Data?
            if inputDict != nil {
             data = try JSONSerialization.data(withJSONObject: inputDict!, options: JSONSerialization.WritingOptions.prettyPrinted)
            }
            let request = jsonReq(urlString, requestType: methodType, data: data)

//            let urlRequest = jsonReqWithAccessToken(urlString, requestType: methodType as String, data: data)
            
            
            //CREATE A TASK WITH REQUEST
            createTaskWithRequest(request, showLoader: showLoader, completion: completion, failure: failure)
            
        }catch
        {
            //END TASK _ FAILURE
            //endTaskWithFailure(showLoader, failure: failure)
            failure(Messages.KNetworkError)
        }
 
    }
    
    private class func createTaskWithRequest(_ urlRequest : NSMutableURLRequest, showLoader: Bool,completion: @escaping (_ result: Any) -> Void, failure:@escaping (_ failurMSG: String)->())
    {
        print("request headers == \(String(describing: urlRequest)) == \(String(describing: urlRequest.allHTTPHeaderFields))")
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest)  {
            data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
//                SVProgressHUD.dismiss()
//                failure(Messages.KNetworkError)
                return
            }
            print("httpResponse \(httpResponse.statusCode)")
            guard httpResponse.statusCode != 403 else {
//                SVProgressHUD.dismiss()
//                failure(Messages.KPermissionDenied)
                return
            }
            if (data != nil) {
                print(String.init(data: data!, encoding: String.Encoding.utf8) ?? "printing data")
            }
            
            if let _ = error
            {
                
                DispatchQueue.main.async(execute: {
                    if showLoader {
//                        SVProgressHUD.dismiss()
                    }
                    
                    failure((error?.localizedDescription)! as String)
                })
                
            }else{
                
                do {
                
                    if let _ = urlRequest.allHTTPHeaderFields!["Deprecated-Version"]{
                        //print("depricated header \(headerDict))")
//                        SVProgressHUD.show(withStatus: "depricated URL \(String(describing: urlRequest.url?.absoluteString)))")
                    }
                    
                    if let dict = (try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any]) {
                         print(dict)
                        completion(dict)
                    }else if let dict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [Any] {
                        print(dict)
                        completion(dict)
                    }else {
                        completion([:])
                    }
                  
                    
                }catch{
                    DispatchQueue.main.async(execute: {
                        if showLoader {
//                            SVProgressHUD.dismiss()
                        }
                        completion([:])
                    })
                    //failure(STRINGVALUES.FAILURE_MESSAGE as String)
                    
                }
            }
        }
        task.resume()
    }
    
    
    private class func createTaskWithRequestVersion(_ urlRequest : NSMutableURLRequest, showLoader: Bool,completion: @escaping (_ result: Any) -> Void, failure:@escaping (_ failurMSG: String)->())
    {
        print("request headers == \(String(describing: urlRequest)) == \(String(describing: urlRequest.allHTTPHeaderFields))")
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest)  {
            data, response, error in
            if let httpResponse = response as? HTTPURLResponse
            {
                print("httpResponse \(httpResponse.statusCode)")
            }            //Helper.FGSLog(response)
            if (data != nil) {
                print(String.init(data: data!, encoding: String.Encoding.utf8) ?? "printing data")
            }
            
            if let _ = error
            {
                
                DispatchQueue.main.async(execute: {
                    if showLoader {
//                        SVProgressHUD.dismiss()
                    }
                    
                    failure((error?.localizedDescription)! as String)
                })
                
            }else{
                
                do {
                    
                    if let _ = urlRequest.allHTTPHeaderFields!["Deprecated-Version"]{
//                        SVProgressHUD.show(withStatus: "depricated URL \(String(describing: urlRequest.url?.absoluteString)))")
                    }
                    
                    if let dict = (try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any]) {
                        print(dict)
                        completion((result:dict, statusCode:(response as! HTTPURLResponse).statusCode))
                    }else if let dict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [Any] {
                        print(dict)
                        //completion(dict)
                        completion((result:dict, statusCode:(response as! HTTPURLResponse).statusCode))
                    }else {
                        completion([:])
                    }
                    
                    
                }catch{
                    DispatchQueue.main.async(execute: {
                        if showLoader {
//                            SVProgressHUD.dismiss()
                        }
                        completion((result:[:], statusCode:(response as! HTTPURLResponse).statusCode))
                    })
                    //failure(STRINGVALUES.FAILURE_MESSAGE as String)
                    
                }
            }
        }
        task.resume()
    }
    
    private class  func endTaskWithFailure(_ showLoader: Bool, failure:(_ failurMSG: String)->())
    {
        DispatchQueue.main.async(execute: {
            if showLoader {
//                SVProgressHUD.dismiss()
            }
        })
        // failure(STRINGVALUES.SERVER_TIMEOUT as String)
    }
    
    private class func endTaskWithFailureInternet(_ showLoader: Bool, failure:(_ failurMSG: String)->())
    {
        DispatchQueue.main.async(execute: {
            if showLoader {
//                SVProgressHUD.dismiss()
            }
        })
        //failure(InternetMessage.MSGInternet)
    }
    
   
    private class  func jsonReq(_ urlString : String, requestType : String,data : Data?) -> NSMutableURLRequest
    {
        let url = urlString.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = requestType
        if data != nil {
            request.httpBody = data
        }
        
        let headers = ["Content-Type" : "application/json"]
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")


       
        
        request.allHTTPHeaderFields = headers

        return request
    }
    
    private class  func jsonReqWithAccessToken(_ urlString : String, requestType : String,data : Data?) -> NSMutableURLRequest
    {
        let request = jsonReq(urlString, requestType: requestType, data: data)
        
        //PASS ACCESS TOKEN
       // var accessToken = ""
//        if  let token =  (Globals.defaults.string(forKey: "authToken")){
//            
//           accessToken = "JWT \(token)"
//        }
//       request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        
        return request
    }
    private class  func jsonReqWithVersion(_ urlString : String, version : String?, requestType : String,data : Data?) -> NSMutableURLRequest
    {
        let url = urlString.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = requestType
        if data != nil {
            request.httpBody = data
        }
        let headers = ["Content-Type" : "application/json", "Accept" : "application/json"]
        //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        
        request.allHTTPHeaderFields = headers
        
        return request
    }
    class func callWebServiceWithHeaderVersion(indicator showLoader: Bool,
                              methodType: String,version: String?, methodName: String, inputDict: [String: Any]?,
                              completion: @escaping (_ result: Any) -> Void,
                              failure:@escaping (_ failurMSG: String) -> Void){
        
        if (Internet.isAvailable() == false) {
            
            //END TASK _ FAILURE
//            SVProgressHUD.dismiss()
//            failure("Network Error")
            
        }
        
        do {
            
            if showLoader {
//                SVProgressHUD.show(withStatus: Loader.loading)
            }
            
            //create request
            let tmpString: String = self.baseUrl()+methodName
            
            let  urlString :String = tmpString.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            var data: Data?
            if inputDict != nil {
                data = try JSONSerialization.data(withJSONObject: inputDict!, options: .prettyPrinted)
            }
            
            let urlRequest = jsonReqWithVersion(urlString, version: version, requestType: methodType as String, data: data)
            
            
            //CREATE A TASK WITH REQUEST
            createTaskWithRequestVersion(urlRequest, showLoader: showLoader, completion: completion, failure: failure)
            
        }catch
        {
            //END TASK _ FAILURE
            //endTaskWithFailure(showLoader, failure: failure)
        }
        
    }
}


