//
//  DetailViewController.swift
//  BountyList2
//
//  Created by 우일규 on 2021/04/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - imgView, nameLabel, BountyLabel
    // > view들은 viewModel을 통해서 구성되기 ?
    
    // ViewModel
    // - DetailViewModel
    // > viewLayer에서 필요한 메서드 만들기
    // > 모델 가지고 있기, BountyInfo들
    
    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var bountyLabel: UILabel?
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        nameLabel?.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel?.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel?.alpha = 0
        bountyLabel?.alpha = 0
    }
    
    private func showAnimation() {
//        nameLabelCenterX.constant = 0
//        bountyLabelCenterX.constant = 0
//
////        UIView.animate(withDuration: 0.3) {
////            self.view.layoutIfNeeded()
////        }
//
////        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
////            self.view.layoutIfNeeded()
////        }, completion: nil)
//
//        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
//
//        UIView.transition(with: imgView!, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel?.transform = CGAffineTransform.identity
            self.nameLabel?.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.bountyLabel?.transform = CGAffineTransform.identity
            self.bountyLabel?.alpha = 1
        }, completion: nil)
        
        UIView.transition(with: imgView!, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func updateUI() {
        if let bountyInfo = self.viewModel.bountyInfo {
            imgView?.image = bountyInfo.image
            nameLabel?.text = bountyInfo.name
            bountyLabel?.text = "\(bountyInfo.bounty)"
        }
    }
//        if let bountyInfo = self.bountyInfo {
//            imgView?.image = bountyInfo.image
//            nameLabel?.text = bountyInfo.name
//            bountyLabel?.text = "\(bountyInfo.bounty)"
//        }

//        if let name = self.name, let bounty = self.bounty {
//            let img = UIImage(named: "\(name).jpg")
//            imgView?.image = img
//            nameLabel?.text = name
//            bountyLabel?.text = "\(bounty)"
//        }
    
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
