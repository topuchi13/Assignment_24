//
//  StartVC.swift
//  Assignment_24
//
//  Created by Nika Topuria on 16.11.21.
//

import UIKit

class StartVC: UIViewController {
    
    @IBOutlet var pickerView: UIPickerView!
    private var numberOfQuestions = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        let sb = UIStoryboard(name: "MainVC", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        vc.numberOfQuestions = numberOfQuestions
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    

}

extension StartVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberOfQuestions = row + 1
    }
}


extension StartVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        50
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: String(row + 1), attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
}
