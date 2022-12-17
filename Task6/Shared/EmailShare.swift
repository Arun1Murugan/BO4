//
//  EmailShare.swift
//  Task6
//
//  Created by Arun_Skyraan on 11/10/22.
//

import SwiftUI

struct EmailShare: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
    
class EmailHelper: UIViewController,
                   MFMailComposeViewControllerDelegate,ObservableObject {
    
    public  static let shared = EmailHelper()
    func sendEmail(subject:String,bibleImage:String, image:String,imgurl:String!,body:String,Aboutus:Bool,isMailNotFound : inout Bool){
        if MFMailComposeViewController.canSendMail() {
            
            let picker = MFMailComposeViewController()
            let obj = ImageLoaderAndCache(imageURL: imgurl)
            let image =  image.toImage()
            //            print("image",image)
            picker.mailComposeDelegate = self
            picker.setToRecipients([""])
            picker.setSubject(subject)
            if Aboutus {
                let appname = "\(Constants.App_Name)"
                let APP_Type = "\(Constants.APP_Type)"
                let deviceName  = "\(Constants.DeviceName)"
                let deviceVersion = "\(Constants.version)"
                let appversion = "\(Constants.appVersion)"
                let countryCode = "\(Constants.countryCode)"
                let Language = "\(Constants.lang)"
                let type = "\(Constants.devicetype)"
                
                picker.setMessageBody("</br></br></br>" + "-- </br> " + "----- Device : \(deviceName), App Version : \(appversion),App Name : \(appname) ,Model : \(type) , iOS Version : \(deviceVersion), Country  : \(countryCode), Language : \(Language) </br></br></br>", isHTML: true)
            }
            picker.setMessageBody(body, isHTML: true)
            if image?.pngData() != nil{
                picker.addAttachmentData((image?.pngData())!, mimeType: "image/png", fileName: "")
            }else if obj != nil{
                //                picker.addAttachmentData((UIImage(named: "L1")?.pngData()!)!, mimeType: "image/png", fileName: "")
            }
            UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
        } else {
            isMailNotFound = true
            // Todo: Add a way to show banner to user about no mail app found or configured
            // Utilities.showErrorBanner(title: "No mail account found", subtitle: "Please setup a mail account")
            return
        }
    }
    func sendEmailwithoutDefaultimage(subject:String,bibleImage:String, image:String,body:String,isMailNotFound : inout Bool){
        if MFMailComposeViewController.canSendMail() {
            
            let picker = MFMailComposeViewController()
            
            //            let image =  UIImage(data: obj.imageData) ?? UIImage()
            picker.mailComposeDelegate = self
            picker.setToRecipients([""])
            picker.setMessageBody(body, isHTML: true)
            //            picker.addAttachmentData(obj.imageData, mimeType: "image/png", fileName: "")
            UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
        } else {
            isMailNotFound = true
            // Todo: Add a way to show banner to user about no mail app found or configured
            // Utilities.showErrorBanner(title: "No mail account found", subtitle: "Please setup a mail account")
            return
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    func FeedbackEmail(isMailNotFound : inout Bool,subject:String,body:String)
    {
        if !MFMailComposeViewController.canSendMail() {
            //                print("No mail account found")
            let ac = UIAlertController(title: "Mail Not Configured", message: "AppNotFoundToShare", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "ok", style: .default))
            //                    present(isPresented: ac, animation: true)
            UIApplication.shared.windows.first?.rootViewController?.present(ac, animated: true)
            isMailNotFound = true
            // Todo: Add a way to show banner to user about no mail app found or configured
            // Utilities.showErrorBanner(title: "No mail account found", subtitle: "Please setup a mail account")
            return
        }
        let picker = MFMailComposeViewController()
        picker.setSubject(subject)
        let appname = "\(Constants.App_Name)"
        let APP_Type = "\(Constants.APP_Type)"
        let deviceName  = "\(Constants.DeviceName)"
        let deviceVersion = "\(Constants.version)"
        let appversion = "\(Constants.appVersion)"
        let countryCode = "\(Constants.countryCode)"
        let Language = "\(Constants.lang)"
        let type = "\(Constants.devicetype)"
        
        
        picker.setMessageBody("Device : \(deviceName)</br> App Version : \(appversion)</br>App Name : \(appname) </br>Model : \(type) ,</br> iOS Version : \(deviceVersion) </br>Country  : \(countryCode)</br> Language : \(Language) </br></br></br>", isHTML: true)
        //            picker.setMessageBody(body, isHTML: true)
    mailto:picker.settorecipients(["feedback@bibleall.net"])
        picker.mailComposeDelegate = self
        UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
        
    }
}
}

struct EmailShare_Previews: PreviewProvider {
    static var previews: some View {
        EmailShare()
    }
}
