//
//  BountyViewController.swift
//  BountyList
//
//  Created by Choyunje on 2021/09/21.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들기
    
    // View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel에 받음
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트
    
    // ViewModel
    // - BountyViewModel
    // > BountyViewModel 만들고, 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 BountyInfo
    
    
    
    
    let viewModel = BountyViewModel()
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 데이터 이동
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int{
                
                let bountyInfo = viewModel.bountyInfo(at: index)
                
                vc?.viewModel.update(model: bountyInfo)
               
                
            }
          
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        return cell
    }

   // UITableViewDelegate 클릭시 입력값 받는 곳
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}


class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}


class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
    BountyInfo(name: "골든리트리버", bounty: "330,000₩"),
        BountyInfo(name: "러시안블루", bounty: "250,000₩"),
        BountyInfo(name: "비글", bounty: "310,000₩"),
        BountyInfo(name: "아기고양이", bounty: "280,000₩"),
        BountyInfo(name: "웰시코기", bounty: "160,200₩"),
        BountyInfo(name: "점박이고양이", bounty: "810,000₩"),
        BountyInfo(name: "치와와", bounty: "730,000₩"),
        BountyInfo(name: "테리어", bounty: "122,000₩")
    ]
    
    var sortedList: [BountyInfo] {
        
        let sortedList = bountyInfoList.sorted { prev, next in
            
            return prev.bounty > next.bounty
        }
        
        return sortedList
    }
    
    
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}


