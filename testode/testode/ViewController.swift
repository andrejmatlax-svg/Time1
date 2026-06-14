
    
    
import UIKit

class ViewController: UIViewController {
//MARK: Свойства
    enum Timer{
        case work
        case rest
        
        
        var duration: Int {
            switch self {
            case .work: return 25
            case .rest: return 10
                
            }
        }
        
        var Color: UIColor {
            switch self {
            case .work: return UIColor(red: 0.92, green: 0.48, blue: 0.44, alpha: 1.0)
            case .rest: return UIColor(red: 0.40, green: 0.76, blue: 0.60, alpha: 1.0)
            }
        }
    }
      
    
    
    
                    
}
