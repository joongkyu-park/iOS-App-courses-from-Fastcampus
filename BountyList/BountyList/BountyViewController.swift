//
//  BountyViewController.swift
//  BountyList
//
//  Created by Apple on 2021/03/14.
//

import UIKit

/*
 테이블뷰 코드
 
 
 class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
     
     // MVVM
     
     // Model
     // - BountyInfo
     // -> BountyInfo 만들자
     
     
     // View
     // - ListCell
     // -> ListCell에 필요한 정보를 ViewModel한테 받아야겠다.
     // -> ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
     
     // ViewModel
     // - BountyViewModel
     // -> BountyViewModel을 만들고, 뷰 레이어에서 필요한 메서드 만들기
     // -> 모델 가지고 있기,, BountyInfo들
     
     
     /*
  테이블뷰의 포로토콜(테이블뷰 서비스를 쓰기 위해서 해야할 일)
  테이블뷰는 2명의 대리인을 통해 물어본다.
      UITableViewDataSource : 테이블뷰 셀 몇 개?, 테이블뷰 어떻게 보여줄까? (필수)
      UITableViewDelegate : 테이블뷰 클릭하면 어떡해? (선택)
      */
     
 //    let bountyInfoList : [BountyInfo] = [
 //        BountyInfo(name: "brook", bounty: 33000000),
 //        BountyInfo(name: "chopper", bounty: 50),
 //        BountyInfo(name: "franky", bounty: 44000000),
 //        BountyInfo(name: "luffy", bounty: 300000000),
 //        BountyInfo(name: "nami", bounty: 16000000),
 //        BountyInfo(name: "robin", bounty: 80000000),
 //        BountyInfo(name: "sanji", bounty: 77000000),
 //        BountyInfo(name: "zoro", bounty: 120000000)
 //    ]
     
     let viewModel = BountyViewModel()
     
 //    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
 //    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
      
     
     // Segue를 하기전 준비하기 위한 함수. (ex 데이터 넘겨주기 등)
     // 이 함수는 원래 UIViewController에 있는 메소드인데, 현재 BountyViewController가 서브클래스이므로 오버라이드가 붙는다.
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         // DetailViewController한테 데이터 줄거야!
         if segue.identifier == "showDetail" {
             let vc = segue.destination as? DetailViewController
             if let index = sender as? Int {
                 
 //                let bountyInfo = bountyInfoList[index]
                 let bountyInfo = viewModel.bountyInfo(at: index)
 //                vc?.bountyInfo = bountyInfo
                 vc?.viewModel.update(model: bountyInfo)
 //                vc?.name = bountyInfo.name
 //                vc?.bounty = bountyInfo.bounty
                 
                 
                 
                 
 //                vc?.name = nameList[index]
 //                vc?.bounty = bountyList[index]
             }
         }
     }
     
     
     override func viewDidLoad() {
         super.viewDidLoad()
     }
     
     // UITableViewDataSource
     
     // 몇 개를 보여줄거야?
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

         return viewModel.numOfBountyInfoList
         //        return bountyInfoList.count
         //        return bountyList.count
     }
     
     // 셀은 어떻게 표현할거야?
     // -> ListCell 쓸거야. 커스터아미징 했으니까.
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
         return UITableViewCell()
         } // as 문을 통해서 변수 cell을 커스텀셀인 ListCell로 다운캐스팅 해준다. 캐스팅이 안될수도 있으니 옵셔널로.
         
 //        let bountyInfo = bountyInfoList[indexPath.row]
         let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
         
         cell.update(info: bountyInfo)
 //        cell.imgView.image = bountyInfo.image
 //        cell.nameLabel.text = bountyInfo.name
 //        cell.bountyLabel.text = "\(bountyInfo.bounty)"
         
 //        // img, name, bounty
 //        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
 //        cell.imgView.image = img
 //        cell.nameLabel.text = nameList[indexPath.row]
 //        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
         return cell
         
         
 //        위와 같은 코드
 //        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell{
 //            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
 //            cell.imgView.image = img
 //            cell.nameLabel.text = nameList[indexPath.row]
 //            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
 //            return cell
 //        } else {
 //            return UITableViewCell()
 //        }
         
         
     }
     
     // UITableViewDelegate
     // 셀이 클릭되었을 때 어떻게 할거야?
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("--> \(indexPath.row)")
         
         performSegue(withIdentifier: "showDetail", sender: indexPath.row) // sender로 데이터전달
     }
 }

 // 커스텀 셀 만들기
 class ListCell : UITableViewCell {
     @IBOutlet weak var imgView: UIImageView!
     @IBOutlet weak var nameLabel: UILabel!
     @IBOutlet weak var bountyLabel: UILabel!
     
     func update(info:BountyInfo) {
         imgView.image = info.image
         nameLabel.text = info.name
         bountyLabel.text = "\(info.bounty)"
     }
 }

 //struct BountyInfo {
 //    let name: String
 //    let bounty: Int
 //
 //    var image: UIImage? {
 //        return UIImage(named: "\(name).jpg")
 //    }
 //
 //    init(name:String, bounty : Int){
 //        self.name = name
 //        self.bounty = bounty
 //    }
 //}   ==> 클래스를 새로 만듬. 분류위해.


 class BountyViewModel {
     
     let bountyInfoList : [BountyInfo] = [
         BountyInfo(name: "brook", bounty: 33000000),
         BountyInfo(name: "chopper", bounty: 50),
         BountyInfo(name: "franky", bounty: 44000000),
         BountyInfo(name: "luffy", bounty: 300000000),
         BountyInfo(name: "nami", bounty: 16000000),
         BountyInfo(name: "robin", bounty: 80000000),
         BountyInfo(name: "sanji", bounty: 77000000),
         BountyInfo(name: "zoro", bounty: 120000000)
     ]
     
     var sortedList:[BountyInfo] {
         let sortedList = bountyInfoList.sorted { prev, next in
             return prev.bounty > next.bounty
         }
         return sortedList
     }
     
     var numOfBountyInfoList : Int {
         return bountyInfoList.count
     }
     
     func bountyInfo(at index: Int) -> BountyInfo{
 //        return bountyInfoList[index]
         return sortedList[index]
     }
 }


 
 */

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // 콜렉션 뷰에서는 아이템들을 자유롭게 배치할 수 있어서 UICollectionViewFlowLayout도 사용한다.
    
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)

                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UICollectionView
    // 몇 개를 보여줄까요?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    // 셀은 어떻게 표현할까요?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else{ return UICollectionViewCell() }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        
        return cell
    }
    
    // UICollectionViewDelegate
    // 셀이 클릭되었을 때 어떡할까요?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    
    // UICollectionViewFlowLayout
    // cell size를 계산할거다. (목표 : 다양한 디바이스에서 일관적인 디자인을 보여주기 위해)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = width * 10/7 + textAreaHeight
        
        return CGSize(width: width,height: height)
    }
}

// 커스텀 셀 만들기
class GridCell : UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info:BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}

class BountyViewModel {
    
    let bountyInfoList : [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList:[BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList : Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
//        return bountyInfoList[index]
        return sortedList[index]
    }
}

