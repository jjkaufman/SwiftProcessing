import UIKit

public extension Sketch{
    
    func createImage(_ name: String, _ width: CGFloat? = nil, _ height: CGFloat? = nil) -> CGImage{
        var w = width
        var h = height
        var image = UIImage(named: name)
        if (w != nil && h != nil){
            image = UIImage.scale(image: image!, width: w!, height: h!)
        }else{
            w = image!.size.width
            h = image!.size.width
        }
        return (image?.cgImage)!
    }
    
    func image(_ name: CGImage, _ x: CGFloat, _ y: CGFloat){

            let w = CGFloat(name.width)
            let h = CGFloat(name.height)
        
        
        context?.draw(name, in: CGRect(x: x, y: y, width: w, height: h))
        //        context?.draw(image, in: CGRec
        //        context?.draw(image, in: CGRect(
        //        context?.draw(UIImage.resize(UIImage(named: name)?, width CGSize())) .cgImage, in: CGRect)
        
    }
}


extension UIImage {
    class func resize(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    class func scale(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage? {
        let scaledSize = CGSize(width: width, height: height)
        return UIImage.resize(image: image, targetSize: scaledSize)
    }
}