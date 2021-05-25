//
//  BountyViewController.swift
//  BountyList2
//
//  Created by 우일규 on 2021/04/25.
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel한테서 받아야겠다.
    // > ListCell은 ViewModel로부터 받은 정보로 뷰 업데이트 하기
    
    // ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고, ViewLayer에서 필요한 메서드 만들기
    // > 모델 가지고 있기, BountyInfo들
    
    let bountyInfoList: [BountyInfo] = [
    BountyInfo(name: "BROOK", bounty: "₩33,000,000"),
    BountyInfo(name: "CHOPPER", bounty: "₩50"),
    BountyInfo(name: "FRANKY", bounty: "₩44,000,000"),
    BountyInfo(name: "LUFFY", bounty: "₩30,000,000"),
    BountyInfo(name: "NAMI", bounty: "₩16,000,000"),
    BountyInfo(name: "ROBIN", bounty: "₩80,000,000"),
    BountyInfo(name: "SANJI", bounty: "₩77,000,000"),
    BountyInfo(name: "ZORO", bounty: "₩12,000,000")
    ]
    
    let viewModel = BountyViewModel()
//    let nameList = ["BROOK", "CHOPPER", "FRANKY", "LUFFY", "NAMI", "ROBIN", "SANJI", "ZORO"]
//    let bountyList = ["₩33,000,000", "₩50", "₩44,000,000", "₩30,000,000", "₩16,000,000", "₩80,000,000", "₩77,000,000", "₩12,000,000"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
//                let bountyInfo = bountyInfoList[index]
                let bountyInfo = viewModel.bountyInfo(at: index)
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
                vc?.viewModel.update(model: bountyInfo)
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UICollectionViewDataSource 몇개를 보여줄까요?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    // UICollectionViewDataSource 셀은 어떻게 표현할까요?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
                cell.update(info: bountyInfo)
        cell.update(info: bountyInfo)
        return cell
    }
    
    // UICollectionViewDelegate 셀이 클릭되었을 때 어떡할까요?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    // UICollectionViewDelegateFlowLayout 셀 사이즈를 계산 (다양한 디바이스에서 일관적인 디자인을 보여주기 위해)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = width * 10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
    
//    // UITableViewDataSource
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return bountyInfo.count
////        return bountyInfoList.count
//        return viewModel.numOfBountyInfoList
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
//            return UITableViewCell()
//        }
//
////        let bountyInfo = bountyInfoList[indexPath.row]
//        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
//        cell.update(info: bountyInfo)
////        cell.imgView?.image = bountyInfo.image
////        cell.nameLabel?.text = bountyInfo.name
////        cell.bountyLabel?.text = "\(bountyInfo.bounty)"
//
//        return cell
//    }
//
//    // UITableViewDelegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // diddeSelectRowAt을 사용함으로써 index mismatch 오류발생하였음.
//        print("--> \(indexPath.row)")
//        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
//    }
}

class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
    BountyInfo(name: "BROOK", bounty: "₩33,000,000"),
    BountyInfo(name: "CHOPPER", bounty: "₩10,000,000"),
    BountyInfo(name: "FRANKY", bounty: "₩44,000,000"),
    BountyInfo(name: "LUFFY", bounty: "₩30,000,000"),
    BountyInfo(name: "NAMI", bounty: "₩16,000,000"),
    BountyInfo(name: "ROBIN", bounty: "₩80,000,000"),
    BountyInfo(name: "SANJI", bounty: "₩77,000,000"),
    BountyInfo(name: "ZORO", bounty: "₩12,000,000")
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

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var bountyLabel: UILabel?
    
    func update(info: BountyInfo) {
        imgView?.image = info.image
        nameLabel?.text = info.name
        bountyLabel?.text = "\(info.bounty)"
    }
}
