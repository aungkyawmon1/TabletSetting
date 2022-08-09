//
//  MasterViewController.swift
//  TabletSetting
//
//  Created by MacBook Pro on 08/08/2565 BE.
//

import UIKit

protocol ColorSelectionDelegate{
    func colorSelected(selectedColor: UIColor)
}

struct Model{
    let name: String
    let color: UIColor
}

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView : UITableView!
    static var delegate: ColorSelectionDelegate?
    
    var colors = [Model(name: "Red", color: UIColor.red),Model(name: "Blue", color: UIColor.blue),Model(name: "Green", color: .green),Model(name: "Yellow", color: .yellow),Model(name: "Pink", color: .systemPink)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = colors[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let destinationVC = MasterViewController.delegate as? DetailViewController{
            self.splitViewController?.showDetailViewController(destinationVC, sender: self)
            MasterViewController.delegate?.colorSelected(selectedColor: colors[indexPath.row].color)
        }
    }
}
