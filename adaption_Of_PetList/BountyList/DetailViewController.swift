//
//  DetailViewController.swift
//  BountyList
//
//  Created by Choyunje on 2021/09/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들기
    
    // View
    // - imgView, nameLabel, bountyLabel
    // > view들은 viewModel를 통해서 구성되기
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트
    
    // ViewModel
    // - DetailViewModel
    // > 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 BountyInfo
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        
        if let bountyInfo = self.viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
       
    
}
    @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
