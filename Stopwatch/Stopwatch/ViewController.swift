//
//  ViewController.swift
//  Stopwatch
//
//  Created by 김선규 on 10/11/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    
    // MARK: - Variables
    private var mainStopwatch: Stopwatch = Stopwatch()
    private var lapStopwatch: Stopwatch = Stopwatch()
    private var isPlay: Bool = false
    private var lapTimeList: [String] = []
    
    // MARK: - UI Components
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Stopwatch"
        return label
    }()
    
    private let lineView: UIView = {
        let line = UIView()
        line.layer.borderWidth = 1.0
        line.layer.borderColor = UIColor.black.cgColor
        line.isHidden = false
        return line
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 50)
        label.text = "00:00:00"
        return label
    }()
    
    private let lapTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.text = "00:00:00"
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        sv.spacing = 120
        return sv
    }()
    
    private let startAndStopButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Start", for: .normal)
        btn.setTitleColor(.green, for: .normal)
        btn.addTarget(ViewController.self, action: #selector(tappedStartAndStopButton), for: .touchUpInside)
        return btn
    }()
    
    private let lapAndResetButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Lap", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.isEnabled = false
        btn.addTarget(ViewController.self, action: #selector(tappedLapAndResetButton), for: .touchUpInside)
        return btn
    }()
    
    private let recordTableView: UITableView = {
        let record = UITableView()
        
        return record
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.recordTableView.dataSource = self
//        self.recordTableView.delegate = self
        
        self.setupUI()
        
    }
    
    // MARK: - configure UI
    private func setupUI() {
        self.view.addSubview(mainTitle)
        self.mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.mainTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.mainTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        self.view.addSubview(lineView)
        self.lineView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.lineView.topAnchor.constraint(equalTo: self.mainTitle.bottomAnchor, constant: 15),
            self.lineView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.lineView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.lineView.heightAnchor.constraint(equalToConstant: 1.0),
        ])
        
        self.view.addSubview(timeLabel)
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.timeLabel.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 70),
            self.timeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.view.addSubview(lapTimeLabel)
        self.lapTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.lapTimeLabel.bottomAnchor.constraint(equalTo: self.timeLabel.topAnchor, constant: 0),
            self.lapTimeLabel.trailingAnchor.constraint(equalTo: self.timeLabel.trailingAnchor)
        ])
    
        self.view.addSubview(buttonStackView)
        [lapAndResetButton, startAndStopButton].map {
            self.buttonStackView.addArrangedSubview($0)
        }
        self.buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.buttonStackView.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 80),
            self.buttonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.view.addSubview(recordTableView)
        self.recordTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.recordTableView.topAnchor.constraint(equalTo: self.buttonStackView.bottomAnchor, constant: 40),
            self.recordTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.recordTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.recordTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
    }
    
    // MARK: - functions
    @objc func tappedStartAndStopButton() {
        lapAndResetButton.isEnabled = true
        
        if !isPlay {
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(updateMainTimer), userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(updateLapTimer), userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopwatch.timer, forMode: .common)
            RunLoop.current.add(lapStopwatch.timer, forMode: .common)
            
            
            isPlay = true
            
            startAndStopButton.setTitle("Stop", for: .normal)
        } else {
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            isPlay = false
            startAndStopButton.setTitle("Start", for: .normal)
            lapAndResetButton.setTitle("Reset", for: .normal)
        }
    }
    
    @objc func tappedLapAndResetButton() {
        if !isPlay {
            resetMainTimer()
            resetLapTimer()
            
            RunLoop.current.add(mainStopwatch.timer, forMode: .common)
            RunLoop.current.add(lapStopwatch.timer, forMode: .common)
            
            lapAndResetButton.setTitle("Lap", for: .normal)
            lapAndResetButton.isEnabled = false
        } else {
            if let timeLabelText = timeLabel.text {
                lapTimeList.append(timeLabelText)
            }
            recordTableView.reloadData()
            resetLapTimer()
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(tappedLapAndResetButton), userInfo: nil, repeats: true)
        }
    }
    
    func resetMainTimer() {
        resetTimer(mainStopwatch, label: timeLabel)
        lapTimeList.removeAll()
        recordTableView.reloadData()
    }
    
    func resetLapTimer() {
        resetTimer(lapStopwatch, label: lapTimeLabel)
    }
    
    func resetTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00:00"
    }
    
    @objc func updateMainTimer() {
        updateTimer(mainStopwatch, label: timeLabel)
    }
    
    @objc func updateLapTimer() {
        updateTimer(lapStopwatch, label: lapTimeLabel)
    }
    
    func updateTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.counter += 0.035
        
        var minutes: String = "\(Int(stopwatch.counter / 60))"
        if Int(stopwatch.counter / 60) < 10 {
            minutes = "0\(Int(stopwatch.counter / 60))"
        }
        
        var seconds: String = String(format: "$.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = minutes + ":" + seconds
    }

   
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapTimeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "lapCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap \(lapTimeList.count - indexPath.row)"
        }
        
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = lapTimeList[lapTimeList.count - indexPath.row - 1]
        }
        
        return cell
    }
    
}
//
//extension ViewController: UITableViewDelegate {
    
//}


struct VCPreView:PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}
