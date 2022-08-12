//
//  VideoEditorSpeedRateView.swift
//  HXPHPicker
//
//  Created by JOJO on 2022/8/12.
//

import UIKit
protocol VideoEditorSpeedRateViewDelegate: AnyObject {
    func speedRateView(_ speedRateView: VideoEditorSpeedRateView, didChangedSpeedRate rate: Float)
    
}
class VideoEditorSpeedRateView: UIView {
    weak var delegate: VideoEditorSpeedRateViewDelegate?
    var collection: UICollectionView!
    var speedList: [Float] = [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2]
    var currenRate: Float = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSpeedView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        collection.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSpeedView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        addSubview(collection)
        
        collection.register(VideoSpeedRateCell.self, forCellWithReuseIdentifier: "VideoSpeedRateCell")
        
    }

}

extension VideoEditorSpeedRateView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoSpeedRateCell", for: indexPath) as! VideoSpeedRateCell
        let speed = speedList[indexPath.item]
        cell.contentLabel.text = "x\(speed)"
        if currenRate == speed {
            cell.contentLabel.textColor = UIColor.white
            cell.backgroundColor = UIColor.systemBlue
        } else {
            cell.contentLabel.textColor = UIColor.black
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return speedList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension VideoEditorSpeedRateView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let padding: CGFloat = 20
        
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let padding: CGFloat = 20
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let padding: CGFloat = 20
        return padding
    }
    
}

extension VideoEditorSpeedRateView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let speed = speedList[indexPath.item]
        if currenRate != speed {
            currenRate = speed
            delegate?.speedRateView(self, didChangedSpeedRate: currenRate)
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}




class VideoSpeedRateCell: UICollectionViewCell {
    let contentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        //
        backgroundColor = UIColor.white
        layer.cornerRadius = 5
        layer.masksToBounds = true
        //
        contentLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        contentLabel.textColor = .black
        contentLabel.textAlignment = .center
        contentView.addSubview(contentLabel)
        contentLabel.frame = CGRect(x: 0, y: 0, width: contentView.bounds.size.width, height: contentView.bounds.size.height)
        
    }
}





