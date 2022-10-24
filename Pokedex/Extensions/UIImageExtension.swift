//
//  UIImageExtension.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import UIKit

struct GradientColor {
    let color: UIColor
    let location: CGFloat
}

extension UIImage {
    func maskWithGradientColor(_ gradients: [GradientColor]) -> UIImage? {
        guard let maskImage = self.cgImage else {
            return nil
        }
        
        let width = self.size.width
        let height = self.size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let bitmapContext = CGContext(data: nil,
                                      width: Int(width),
                                      height: Int(height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: bitmapInfo.rawValue)
        
        let colors = gradients.map { $0.color.cgColor } as CFArray
        let locations = gradients.map { $0.location }
        
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) else {
            return nil
        }
        
        let startPoint = CGPoint(x: width / 2, y: 0)
        let endPoint = CGPoint(x: width / 2, y: height)
        
        bitmapContext?.clip(to: bounds, mask: maskImage)
        bitmapContext?.drawLinearGradient(gradient,
                                          start: startPoint,
                                          end: endPoint,
                                          options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        
        if let cImage = bitmapContext?.makeImage() {
            let coloredImage = UIImage(cgImage: cImage)
            return coloredImage
        } else {
            return nil
        }
    }
}
