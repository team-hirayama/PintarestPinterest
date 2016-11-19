//
//  Photo.swift
//  PracticePinterest
//
//  Created by NishiokaKohei on 2016/11/19.
//  Copyright © 2016年 Kohey. All rights reserved.
//

import UIKit

class Photo {

    // MARK:- Class Method
    class func allPhotos() -> [Photo]? {
        var photos = [Photo]()
        guard let URL = NSBundle.mainBundle().URLForResource("Photos", withExtension: "plist") else {
            return photos
        }
        
        if let photosFromPlist = NSArray(contentsOfURL: URL) {
            for dictionary in photosFromPlist {
                let photo = Photo(dictionary: dictionary as! NSDictionary)
                photos.append(photo)
            }
        }
        
        return photos
    }

    // MARK:- Instance property
    var caption: String
    var comment: String
    var image: UIImage
    
    init(caption: String, comment: String, image: UIImage) {
        self.caption = caption
        self.comment = comment
        self.image = image
    }

    // MARK:- Instance Method
    convenience init(dictionary: NSDictionary) {
        let caption = dictionary["Caption"] as? String
        let comment = dictionary["Comment"] as? String
        let photo = dictionary["Photo"] as? String
        let image = UIImage(named: photo!)?.decompressedImage
        
        
        self.init(caption: caption!, comment: comment!, image: image!)
    }
    
    func heightForComment(font: UIFont, width: CGFloat) -> CGFloat {
        let rect = NSString(string: comment).boundingRectWithSize(CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return ceil(rect.height)
    }

    
}
