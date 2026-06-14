
    
    
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
    
    
    
    
    @objc private func controlButtonTapped() {
            if isTimerRunning {
                pauseTimer()
            } else {
                startTimer()
            }
        }
    
    
    
    
    private func startTimer() {
            isTimerRunning = true
            updateButtonIcon()
            
            timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.tick()
            }
        }
    private func switchMode() {
            // Меняем режим на противоположный
            currentMode = (currentMode == .work) ? .rest : .work
        secondLeft = currentMode.duration
            
            // Легкая вибрация при переключении режима
            let feedbackGenerator = UINotificationFeedbackGenerator()
            feedbackGenerator.notificationOccurred(.success)
            
            UIView.animate(withDuration: 0.3) {
                self.updateUIForCurrentMode()
            }
        }
    
    private func updateUIForCurrentMode() {
            let color = currentMode.Color
            
            containerCircleView.layer.borderColor = color.cgColor
            timeLabel.textColor = color
            modeLabel.textColor = color
            controlButton.tintColor = color
            
            modeLabel.text = (currentMode == .work) ? "РАБОТА" : "ОТДЫХ"
            
            updateTimeLabel()
            updateButtonIcon()
        }
    
    
    
    
    private func pauseTimer() {
            isTimerRunning = false
            timer1?.invalidate()
            timer1 = nil
            updateButtonIcon()
        }
    
    private func tick() {
            if secondLeft > 0 {
                secondLeft -= 1
                updateTimeLabel()
            } else {
                switchMode()
            }
        }
    
    private func updateTimeLabel() {
            let minutes = secondLeft / 60
            let seconds = secondLeft % 60
            timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
        }
        
    
    
}
