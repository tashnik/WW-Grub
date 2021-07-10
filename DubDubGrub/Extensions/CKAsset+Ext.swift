//
//  CKAsset+Ext.swift
//  DubDubGrub
//
//  Created by Tashnik on 7/8/21.
//

import CloudKit
import UIKit

extension CKAsset {
  
  func convertToUIImage(in dimension: ImageDimension) -> UIImage {
    let placeHolder = ImageDimension.getPlaceholder(for: dimension)
    
    guard let fileUrl = self.fileURL else { return placeHolder }
    
    do {
      let data = try Data(contentsOf: fileUrl)
      return UIImage(data: data) ?? placeHolder
    } catch {
      return placeHolder
    }
  }
}


