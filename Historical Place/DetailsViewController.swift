//
//  DetailsViewController.swift
//  Historical Place
//
//  Created by MacBook Pro on 7/17/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit
import MapKit
import WebKit


class DetailsViewController: UIViewController, WKNavigationDelegate {
    
    var sentData1: String!
    var sentData2: String!
    var sentData3: String!

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
  
    @IBOutlet weak var animateImage: UIImageView!
    

    @IBOutlet weak var myWeb: WKWebView!
    //var webView = WKWebView()
    var nextRuleCounter = 1
    
    @IBAction func NEXT(_ sender: Any) {
        
    }
    
    //for animation
    var isGoingToNext = false
    var round_about: [UIImage] = []
    var heart: [UIImage] = []
    
    
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        
        return imageArray
    }
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 5
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        //detailImageView.alpha = 0
        print("2nd")
        imageView.image = detailImageView.image
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if let url = Bundle.main.url(forResource: "index", withExtension: "html"){
            if let htmlData = try? Data(contentsOf: url){
                let baseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
                myWeb.load(htmlData, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: baseUrl)
                
            }
        }*/
        
       
        
        round_about = createImageArray(total: 10, imagePrefix: "round_about")
        heart = createImageArray(total: 4, imagePrefix: "heart")

        // Do any additional setup after loading the view.
        self.navigationItem.title = sentData1
        
        detailTitle.text = sentData1
        
        detailImageView.image = UIImage(named: sentData3)
       
        if detailTitle.text == "Round About" && nextRuleCounter == 1 {
            
            detailTextView.text = "Indicates that a roundabout is ahead. Slow down when you see this sign."
            
            animate(imageView: animateImage, images: round_about)
            //print("1st")
            
            
            let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
            let folderPath = Bundle.main.bundlePath
            let baseUrl = URL(fileURLWithPath: folderPath, isDirectory: true)
            do {
                let htmlString = try NSString(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8.rawValue)
                myWeb.loadHTMLString(htmlString as String, baseURL: baseUrl)
            } catch {
                // catch error
            }
           // myWeb.
            //myWeb.navigationDelegate = self
            //view = webView
            //myWeb = view as! WKWebView?
          
        }
        if detailTitle.text == "Double Bend First Left" {
            
            detailTextView.text = "These signs indicate that ahead are dangerous or unexpected bends in the road, some being continuous, others being sharp-ended.Signs indicate the curves are to the left whether the degree to which the curves or bends are sharp. They may also indicate a series of curves or bends ahead."
            animate(imageView: animateImage, images: heart)
            
        }
        if detailTitle.text == "Dual Carriageway Ends" {
            
            detailTextView.text = "A dual carriageway is a road which has two lanes of traffic travelling in each direction with a strip of grass or concrete down the middle to separate the two lots of traffic."
            
            
        }
        if detailTitle.text == "Height Limit Ahead" {
            
            detailTextView.text = "Prohibiting vehicles above a certain height are used mainly at non—arch bridges and other structures.These signs should not be used at arch bridges, as the main risk to these is from vehicles which, although low enough to pass through the central part of the arch, might strike the curved shoulder of the structure."
            
            
        }
        if detailTitle.text == "Road Narrow On Both Sides" {
            
            detailTextView.text = "Narrow means less wide or to make less wide. When you narrow down your choices, you decrease the number of choices. A road might be too narrow for a car. When used to describe something physical such as a street or hips, narrow simply means not wide."
            
            
        }
        if detailTitle.text == "Road Narrows In The Right" {
            
            detailTextView.text = "Narrow means less wide or to make less wide. When you narrow down your choices, you decrease the number of choices. A road might be too narrow for a car. When used to describe something physical such as a street or hips, narrow simply means not wide."
            
            
        }
        if detailTitle.text == "Sharp Bend To The Right" {
            
            detailTextView.text = "These signs indicate that ahead are dangerous or unexpected bends in the road, some being continuous, others being sharp-ended.Signs indicate the curves are to the right whether the degree to which the curves or bends are sharp. They may also indicate a series of curves or bends ahead."
          
        }
       
        if detailTitle.text == "Steep Hill Downwards" {
            
            detailTextView.text = "The sign indicates a steep hill downwards.Having or being a slope or gradient approaching the perpendicular."
            
            
        }
        if detailTitle.text == "Steep Hill Upwards" {
            
            detailTextView.text = "The sign indicates a steep hill upwards.A steep slope rises at a very sharp angle and is difficult to go up."
            
            
        }
    
        if detailTitle.text == "Two way Traffic Straight Ahead" {
            
            detailTextView.text = "A two-way street is a street that allows vehicles to travel in both directions. On most two-way streets, especially main streets, a line is painted down the middle of the road to remind drivers to stay on their side of the road."
     
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
 
    

}
