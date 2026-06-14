
    
    
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
        
        
        
        
    }
                    
                    
}
