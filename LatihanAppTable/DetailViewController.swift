//
//  DetailViewController.swift
//  LatihanAppTable
//
//  Created by Ipung Dev Center on 4/28/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var stringGambar = ""
    var stringKode = ""
    var stringNama = ""

    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var txtKode: UILabel!
    @IBOutlet weak var txtNama: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgDetail.image = UIImage(named: stringGambar)
        txtKode.text = stringKode
        txtNama.text = stringNama

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
