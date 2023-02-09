//
//  ViewController.swift
//  CricInfo
//
//  Created by bjit on 8/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkBtn(_ sender: Any) {
        
        
    var model: (Result<MatchesAPIResponseModel,APIError>)->Void =
        NetworkHelper.shared.fetchData(model:model){
            result in
            switch result {
            case .success(let response):
                dump(response)
                break
                //                self?.articles += response.articles
                //                CoreDataHelper.shared.storeNewFetchedDataAll(articles: response.articles, category: Constants.Business)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
        
        //        APIFixtureHelper.shared.fetchData(){ result in
        //            switch result {
        //            case .success(let response):
        //                dump(response)
        //                break
        //                //                self?.articles += response.articles
        ////                CoreDataHelper.shared.storeNewFetchedDataAll(articles: response.articles, category: Constants.Business)
        //
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //
        //        }
    }
    
}

