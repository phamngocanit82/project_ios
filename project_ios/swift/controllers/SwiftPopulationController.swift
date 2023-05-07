//
//  PopulationController.swift
//  project_ios
//
//  Created by An Pham Ngoc on 5/5/23.
//

import Foundation
import UIKit
class SwiftPopulationController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var array: [SwiftPopulationModel] = [SwiftPopulationModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        AlamofireService.sharedInstance.receiveData(_url: "https://datausa.io/api/data?drilldowns=Nation&measures=Population", _method: Global.NETWORK_METHOD_GET) { result, code, message in
            let data_list = result?.object(forKey: "data") as! [AnyObject]
            for item in data_list {
                var populationModel = SwiftPopulationModel()
                populationModel = populationModel.parseData(item as! NSDictionary)
                self.array.append(populationModel)
            }
            self.tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    override func viewDidLayoutSubviews() {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension SwiftPopulationController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftPopulationCell") as! SwiftPopulationCell
        cell.delegate = self;
        cell.setPopulation(_index: indexPath.item, _populationModel: array[indexPath.item])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
extension SwiftPopulationController: SwiftPopulationCellDelegate {
    func actionPopulation(_ swiftPopulationCell: SwiftPopulationCell){
        UtilsLog.log(swiftPopulationCell.populationModel)
    }
}
