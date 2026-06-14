
    
    
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
      
    
    private var currentMode: Timer = .work
    private var timer1: Timer?
    private var secondLeft: Int = Timer.work.duration
    private var isTimerRunning: Bool = false
    
 
    
    
    private let containerCircleView: UIView = {
            let view = UIView()
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
                view.backgroundColor = .clear
                view.layer.borderWidth = 3
                return view
            }()
    
    private let timeLabel: UILabel = {
            let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont.systemFont(ofSize: 54, weight: .thin)
                label.textAlignment = .center
                return label
            }()
    
    private let controlButton: UIButton = {
            let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
                button.tintColor = .systemGray 
                return button
            }()
                    
}
