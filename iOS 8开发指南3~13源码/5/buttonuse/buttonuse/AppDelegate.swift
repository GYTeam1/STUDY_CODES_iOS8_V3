//
//  AppDelegate.swift
//  buttonuse
//
//  Created by 管西京 on 14-6-9.
//  Copyright (c) 2014年 apple. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow

    @IBOutlet var pushButton: NSButton

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        pushButton.action = Selector("pushButtonClick")
    }
    func pushButtonClick(){
        print("Hello , welcome to http://www.sohu.com")
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

