//
//  ViewController.swift
//  parseSomeHTML
//
//  Created by Fenkins on 29/03/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        
        
        
        let url = NSURL(string: "http://www.folkro.ru/novosti/1/")
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        
        
        

        
        
        let html = "<html><head></head><body><ul><li><input type='image' name='input1' value='string1value' class='abc' /></li><li><input type='image' name='input2' value='string2value' class='def' /></li></ul><span class='spantext'><b>Hello World 1</b></span><span class='spantext'><b>Hello World 2</b></span><a href='example.com'>example(English)</a><a href='example.co.jp'>example(JP)</a></body>"
        
        var err : NSError?
        var parser     = HTMLParser(html: html, error: &err)
        if err != nil {
            println(err)
            exit(1)
        }
        
        var bodyNode   = parser.body
        
        if let inputNodes = bodyNode?.findChildTags("b") {
            for node in inputNodes {
                println(node.contents)
            }
        }
        
        if let inputNodes = bodyNode?.findChildTags("a") {
            for node in inputNodes {
                println(node.contents)
                println(node.getAttributeNamed("href"))
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

