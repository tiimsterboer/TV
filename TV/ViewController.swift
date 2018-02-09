//
//  ViewController.swift
//  TV
//
//  Created by Tim Beemsterboer on 2/9/18.
//  Copyright © 2018 Tim Beemsterboer. All rights reserved.
//

import UIKit

struct TVShow: Decodable {
    let id : Int32
    let name : String
    let type : String
    let language : String
    let genres : Array<String>
}

class ViewController: UIViewController {
    
    var shows = [TVShow]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onRequestTapped(_ sender: Any) {
        for index in 0...138 {
        let jsonurl = "https://api.tvmaze.com/shows?page=\(index)"
        let url = URL(string: jsonurl)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do {
                self.shows = try JSONDecoder().decode([TVShow].self, from: data!)
                //for show in self.shows {
                    //print(show.name)
                    
                //}
                print(self.shows)
            } catch {
                print("error")
            }
        }.resume()
    }
    }
}

