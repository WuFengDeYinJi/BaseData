//
//  NetworkTools.swift
//  PlantingAndFarming
//


import Foundation
import AFNetworking

enum HTTPRequestType : Int{
    case GET = 0
    case POST = 1
}

class NetworkTools: AFHTTPSessionManager {
    
    // 设计单例 let是线程安全的
    static let shareInstance : NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("application/json")
        tools.responseSerializer.acceptableContentTypes?.insert("text/json")
        tools.responseSerializer.acceptableContentTypes?.insert("text/javascript")
        tools.responseSerializer.acceptableContentTypes?.insert("application/x-json")
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }()
    
    //MARK:-- POST/GET网络请求 -- 无加密
    func request(methodType : HTTPRequestType , urlString : String,parameters :AnyObject?,finsished: @escaping (_ result:AnyObject?,_ error:NSError?) ->()) {
        
        //1.定义成功回调的闭包
        let successCallBack = { (task : URLSessionDataTask ,result : AnyObject?) -> () in
            //把闭包传出去
            finsished(result as AnyObject?, nil)
            
        }
        //2.定义失败的回调闭包
        let failureCallBack = { (task : URLSessionDataTask? ,error : Error?) -> () in
            //把闭包传出去
            finsished(nil, error as NSError?)
            
        }
        
        
        
        //判断是那种请求 GET
        if methodType == .GET{
            GET(urlString:urlString, parameters: parameters, success: successCallBack, failure: failureCallBack)
        }
        else //POST
        {
            POST(urlString: urlString, parameters: parameters, success: successCallBack, failure: failureCallBack)
        }
    }
    
    //MARK:-- POST/GET网络请求 -- 有加密
    func requestWithURL(methodType : HTTPRequestType , urlString : String,parameters :AnyObject?,secretToken:String,requestTime:String,finsished: @escaping (_ result:AnyObject?,_ error:NSError?) ->()) {
        
        //1.定义成功回调的闭包
        let successCallBack = { (task : URLSessionDataTask ,result : AnyObject?) -> () in
            //把闭包传出去
            finsished(result as AnyObject?, nil)
            
        }
        //2.定义失败的回调闭包
        let failureCallBack = { (task : URLSessionDataTask? ,error : Error?) -> () in
            //把闭包传出去
            finsished(nil, error as NSError?)
            
        }
        
        
        NetworkTools.shareInstance.requestSerializer.setValue(secretToken, forHTTPHeaderField: "Secret-Token")
        NetworkTools.shareInstance.requestSerializer.setValue(requestTime, forHTTPHeaderField: "Request-Time")
        
        //判断是那种请求 GET
        if methodType == .GET{
            GET(urlString:urlString, parameters: parameters, success: successCallBack, failure: failureCallBack)
        }
        else //POST
        {
            POST(urlString: urlString, parameters: parameters, success: successCallBack, failure: failureCallBack)
        }
    }
    
    
    /**
     文件上传
     
     - parameter urlString:                 请求的url
     - parameter parameters:                请求的参数
     - parameter constructingBodyWithBlock: 文件data
     - parameter uploadProgress:            上传进度
     - parameter success:                   请求成功回调
     - parameter failure:                   请求失败回调
     */
    func uploadTaskWithRequest(urlString: String, parameters: AnyObject?, constructingBodyWithBlock:((_ formData:AFMultipartFormData) -> Void)?, uploadProgress: ((_ progress:Progress) -> Void)?, success: ((_ responseObject:AnyObject?) -> Void)?, failure: ((_ error: Error) -> Void)?) -> Void {
        
        
        NetworkTools.shareInstance.post(urlString, parameters: parameters, constructingBodyWith: { (formData) in
            constructingBodyWithBlock!(formData)
        }, progress: { (progress) in
            uploadProgress!(progress)
        }, success: { (task, objc) in
            if objc != nil {
                success!(objc as AnyObject)
            }
        }) { (task, error) in
            failure!(error)
        }
        
        
    }
    
    /**
     下载文件
     
     - parameter request:               请求的request
     - parameter downloadProgressBlock: 下载的进度
     - parameter savePath:              存储路径
     - parameter completionHandler:     完成后回调
     */
    func downloadTaskWithRequest(request: NSURLRequest, downloadProgressBlock: ((_ downloadProgress :Progress) -> Void)?, savePath: String,completionHandler:((_ response:URLResponse, _ error:NSError?) -> Void)?) -> Void{
        
        //创建下载任务
        let task  =  NetworkTools.shareInstance.downloadTask(with: request as URLRequest, progress: { (progress) in
            downloadProgressBlock!(progress)
        }, destination: { (url, response) -> URL in
            return (NSURL(fileURLWithPath: savePath) as URL)
        }) { (response, url, error) in
            if (error == nil) {
                completionHandler!(response ,error! as NSError)
            }
        }
        
        //开启下载
        task.resume()
    }
    
    
    
    
    
    
    
    
    
    
    /**
     get请求
     
     - parameter urlString:  请求的url
     - parameter parameters: 请求的参数
     - parameter success:    请求成功回调
     - parameter failure:    请求失败回调
     */
    func GET(urlString:String,parameters:AnyObject?, success:((_ task:URLSessionDataTask,_ responseObject:AnyObject?) -> Void)?, failure: ((_ task : URLSessionDataTask?,_ error: Error) -> Void)?) -> Void {
        
        NetworkTools.shareInstance.get(urlString, parameters: parameters, progress: nil, success: { (task:URLSessionDataTask, responseObject: Any) in
//            print("请求成功")
            success!(task,responseObject as AnyObject)
        }) { (task : URLSessionDataTask?, error :Error) in
//            print("请求失败")
            failure!(task, error)
        }
        
    }
    
    /**
     *  发送post请求
     *
     *  @param URLString  请求的网址字符串
     *  @param parameters 请求的参数
     *  @param success    请求成功的回调
     *  @param failure    请求失败的回调
     */
    func POST(urlString:String,parameters:AnyObject?, success:((_ task:URLSessionDataTask,_ responseObject:AnyObject?) -> Void)?, failure: ((_ task : URLSessionDataTask?,_ error: Error) -> Void)?) -> Void {
    
        
        NetworkTools.shareInstance.post(urlString, parameters: parameters, progress: nil, success: { (task:URLSessionDataTask, responseObject: Any) in
//            print("请求成功")
            success!(task,responseObject as AnyObject)
        }) { (task : URLSessionDataTask?, error :Error) in
//            print("请求失败")
            failure!(task, error)
        }
    }
}

