//
//  ViewController.swift
//  try
//
//  Created by nadin hossam el din hamdy elsaeed on 11/30/16.
//  Copyright © 2016 nadin hossam el din hamdy elsaeed. All rights reserved.
//

import UIKit


var X = 300
var Y = 90
var message = " "
var UUID = " "
class ViewController: UIViewController , UITextFieldDelegate  {
    // MARK: Properties
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var label2: UITextView!
    @IBOutlet weak var tview: UITextView!
    @IBOutlet weak var Text: UITextField!
    //let Mark:String=" "
    
    @IBOutlet weak var Scroll: UIScrollView!
    //    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url=URL(string: "https://proj-nadinelsaeed693089.codeanyapp.com/welcome")
        let task=URLSession.shared.dataTask(with: url!){  (data, response, error) in
            //        self.label1.text=message
            if error != nil{
                print("error")}else{
                if let content=data{
                    do{//print("hello")
                        let myjson = try JSONSerialization.jsonObject(with: content, options:JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        message = (myjson["message"] as! String?)!
                        //print(myjson)
                        //                    self.label1.text = (myjson["message"] as! String?)!
                        print(message)
                        UUID = (myjson["uuid"] as! String?)!
                        
                        print(UUID)
                        
                    }
                    catch{
                        
                    }
                    
                }}
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field’s user input through delegate callbacks.
        // self.scrollView.contentSize =CGSizeMake(320, 700);
        Text.delegate = self
        
        
        task.resume()
    }
    
    
    private func textFieldShouldReturn(textField: UITextField) -> Bool{
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        //when the user taps Return (or in this case, Done) on the keyboard.
        // MARK: UITextFieldDelegate
        
        Label.text=textField.text
        //let Mark = textField.text
    }
    
    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    
    @IBAction func Send(_ sender: UIButton) {
        
        //        var m = Text.text!
        
        // label1.text="djg"
        
        //print(message)
        let label = UITextView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.center = CGPoint(x:X, y:Y)
        label.textAlignment = .center
        label.isEditable=false
        label.text = Text.text
        //tview.text = message
        self.Scroll.addSubview(label)
        let label1 = UITextView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label1.center = CGPoint(x:50, y:Y+10)
        label1.textAlignment = .center
         label2.text = message
        label1.isEditable=false
        
        self.Scroll.addSubview(label1)
        // label1.text = messa
        
        //        let postEndpoint: String = "http://requestb.in/r4jz64r4"
        //        let url = NSURL(string: postEndpoint)!
        //        let session = URLSession.shared
        //        let postParams : [String: AnyObject] = ["hello": "Hello POST world" as AnyObject]
        //
        //        // Create the request
        //        let request = NSMutableURLRequest(url: url as URL)
        //        request.httpMethod = "POST"
        //        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //        do {
        //            request.httpBody = try JSONSerialization.data(withJSONObject: postParams, options: JSONSerialization.WritingOptions())
        //            print(postParams)
        //        } catch {
        //            print("bad things happened")
        //        }
        //
        //        // Make the POST call and handle it in a completion handler
        //        session.dataTask(with: request as URLRequest, completionHandler: { ( data: Data?, response: URLResponse?, error: Error?) -> Void in
        //            // Make sure we get an OK response
        //            guard let realResponse = response as? HTTPURLResponse,
        //                realResponse.statusCode == 200 else {
        //                    print("Not a 200 response")
        //                    return
        //            }
        //
        //            // Read the JSON
        //            if let postString = NSString(data:data!, encoding: String.Encoding.utf8.rawValue) as? String {
        //                // Print what we got from the call
        //                print("POST: " + postString)
        //                self.performSelector(onMainThread: "updatePostLabel:", with: postString, waitUntilDone: false)
        //            }
        //
        //        } as! (Data?, URLResponse?, Error?) -> Void).resume()
        
        //
        var request = URLRequest(url: URL(string: "https://proj-nadinelsaeed693089.codeanyapp.com/chat")!)
        let session = URLSession.shared
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.setValue(UUID, forHTTPHeaderField: "Authorization")
        
        let values = ["message":Text.text]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: values, options:.prettyPrinted)
            print(values)
        } catch {
            print("bad things happened")
        }
        
        session.dataTask(with: request as URLRequest, completionHandler: { ( data: Data?, response: URLResponse?, error: Error?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? HTTPURLResponse,
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return}
            if let postString = NSString(data:data!, encoding: String.Encoding.utf8.rawValue) as? String {
                // Print what we got from the call
                print("POST: " + postString)
                DispatchQueue.main.sync(execute: {
                    /* Do UI work here */
                var y =  postString.characters.split{$0 == ":"}.map(String.init)
                    label1.text = y[1]
                    });
                
                //                    self.performSelector(onMainThread: "updatePostLabel:", with: postString, waitUntilDone: false)
                
                // self.performS
            }
            
            } as! (Data?, URLResponse?, Error?) -> Void).resume()
        //        var json = ["message":Text.text!]
        //
        //
        //        let session = URLSession(configuration: URLSessionConfiguration.default)
        //
        //
        //        var request = URLRequest(url: URL(string: "https://floating-reef-85649.herokuapp.com/chat")!)
        //
        //
        //        request.httpMethod = "POST"
        //
        //
        //
        //
        //
        //        request.addValue(UUID, forHTTPHeaderField: "Authorization")
        //
        //
        //        do
        //
        //
        //        {
        //            let jsonData = try JSONSerialization.data(withJSONObject:json, options: .prettyPrinted)
        //            request.httpBody = jsonData
        //             let task=URLSession.shared.dataTask(with:request as URLRequest) {(data, response, error) -> Void  in
        //                if error != nil
        //                    {
        //                print ("ERROR")
        //                    }
        //                else
        //            {if let content = data
        //                    {
        //                        do{
        //                            // let responseData = String(data: data!, encoding: String.Encoding.utf8)
        //                            // print(responseData!)
        //                        }
        //                        
        //                        do{
        //                            let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
        //                            message=(myJson["message"] as! String?)!}}}
        //        } catch{
        //                
        //            }}
        //       
        //
        
        //  request.httpBody.
        
        Y+=50
        
    }
    
}

