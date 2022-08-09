//
//  DetailViewController.swift
//  TabletSetting
//
//  Created by MacBook Pro on 08/08/2565 BE.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        MasterViewController.delegate = self
        // Do any additional setup after loading the view.
        title = "Selected color"
    }

}


extension DetailViewController: ColorSelectionDelegate {
    func colorSelected(selectedColor: UIColor) {
        view.backgroundColor = selectedColor
    }
}
