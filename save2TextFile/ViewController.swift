//
//  ViewController.swift
//  save2TextFile
//
//  Created by Dominik Penkava on 10/24/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvTop: UITextView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tvBottom: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvTop.text = "Type your new text right here"
        tvBottom.text = ""
    }

    
    @IBAction func btnWriteText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try tvTop.text.write(to: url!, atomically: true, encoding: .utf8)
            
        } catch {
            print("Error Writing File")
        }
    }
    
    @IBAction func btnReadText(_ sender: Any) {
//        tvBottom.text =
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let contents = try String(contentsOf: url!, encoding: .utf8)
            tvBottom.text = contents
        } catch {
            print("Error Reading File")
        }
    }
    
    
}

