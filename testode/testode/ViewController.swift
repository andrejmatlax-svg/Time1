
    
    
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
    
    private let modeLabel: UILabel = {
            let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
                label.textAlignment = .center
                return label
            }()
        
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        containerCircleView.layer.cornerRadius = containerCircleView.frame.size.width / 2
        }

    
    
    private func setupUI() {
            view.backgroundColor = .white
            
            view.addSubview(modeLabel)
            view.addSubview(containerCircleView)
            containerCircleView.addSubview(timeLabel)
            containerCircleView.addSubview(controlButton)
            
            controlButton.addTarget(self, action: #selector(controlButtonTapped), for: .touchUpInside)
            
            NSLayoutConstraint.activate([
                // Метка текущего режима сверху
                modeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                modeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                // Круглый контейнер по центру экрана
                containerCircleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                containerCircleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                containerCircleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
                containerCircleView.heightAnchor.constraint(equalTo: containerCircleView.widthAnchor),
                
                // Таймер внутри круга (чуть смещен вверх, чтобы уступить место кнопке)
                timeLabel.centerXAnchor.constraint(equalTo: containerCircleView.centerXAnchor),
                timeLabel.centerYAnchor.constraint(equalTo: containerCircleView.centerYAnchor, constant: -15),
                
                // Кнопка управления под цифрами внутри круга
                controlButton.centerXAnchor.constraint(equalTo: containerCircleView.centerXAnchor),
                controlButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
                controlButton.widthAnchor.constraint(equalToConstant: 44),
                controlButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        }
                    
}
