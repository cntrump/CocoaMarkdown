//
//  AppDelegate.swift
//  Example-Mac
//
//  Created by Indragie on 1/15/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

import Cocoa
import CocoaMarkdown

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet var textView: NSTextView!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let path = Bundle.main.path(forResource: "test", ofType: "md")!
        let document = CMDocument(contentsOfFile: path, options: CMDocumentOptions(rawValue: 0))
        let renderer = CMAttributedStringRenderer(document: document, attributes: CMTextAttributes())!
        renderer.register(CMHTMLStrikethroughTransformer())
        renderer.register(CMHTMLSuperscriptTransformer())
        renderer.register(CMHTMLUnderlineTransformer())
        textView.textStorage?.setAttributedString(renderer.render())
    }
}
