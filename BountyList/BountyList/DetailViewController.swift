//
//  DetailViewController.swift
//  BountyList
//
//  Created by Apple on 2021/03/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // -> BountyInfo 만들자
    
    
    // View
    // - imgView, nameLabel, BountyLabel
    // -> view들은 viewModel을 통해서 구성되기 ?
    
    // ViewModel
    // - DetailViewModel
    // -> 뷰 레이어에서 필요한 메서드 만들기
    // -> 모델 가지고 있기,, BountyInfo들
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
//    var bountyInfo: BountyInfo?
    let viewModel = DetailViewModel()
    
//    var name: String?
//    var bounty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    
    private func prepareAnimation(){
        // layout constraints(오토레이아웃)을 이용해 간접적으로 애니메이션 만들기
        // nameLabelCenterX.constant = view.bounds.width
        // bountyLabelCenterX.constant = view.bounds.width
        
        
        // view 속성을 이용하여 직접적으로 애니메이션 만들기
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
        // alpha는 투명도
        
    }
    private func showAnimation() {
        // by. layout constraints
//        nameLabelCenterX.constant = 0
//        bountyLabelCenterX.constant = 0
//
//        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .allowUserInteraction, animations:{ self.view.layoutIfNeeded()}, completion: nil)
//
//        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        
        // by. view properties
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func updateUI(){
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
//        if let name=self.name,let bounty = self.bounty{
//            let img = UIImage(named:"\(name).jpg")
//            imgView.image = img
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
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
