//
//  ViewController.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var manager: GameLogicManager!
	var score: Score!
	var highScore: HighScore!
	var renderer: GameBoardRenderer!
	var restartButton: RestartButton!
    var logoutButton: LogOutButton!

	var dimensions : Int {
		return 4
	}

	var extraSpace: CGFloat { // constant
		return 13
	}

	var winValue: Int { // constant
		return 2048
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setDimention(to: dimensions)
		setupGestures()
		manager.start(with: ModelController.shared.loadTiles(dimension: manager.dimension), score: score.value)
	}
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        if(!isUserLoggedIn){
            self.shouldPerformSegue(withIdentifier: "Loginview", sender: self)
            
        }
    }
    
   
    @objc private func Logout(){
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn");
        UserDefaults.standard.synchronize();
        if logoutButton.isTouchInside{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let next = storyboard.instantiateViewController(withIdentifier: "Loginview")
            let alert = UIAlertController(title: "Are sure to LOGOUT?", message: "Current results will be lost", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                self.renderer.reset()
                self.manager.start()
                self.present(next, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)

        }
        
        
        
    }
    @objc private func restartGame() {
		let alert = UIAlertController(title: "Are sure to start new game?", message: "Current results will be lost", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
			self.renderer.reset()
			self.manager.start()
		}))
		alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

	private func setDimention(to dimension: Int) {
		self.clearSubviews()

		let boardSize = CGSize(width: self.view.frame.width - (extraSpace - 1) * 1, height: self.view.frame.width - (extraSpace - 1) * 1)
		let board = Board(dimension: dimension, offsetBtwTiles: extraSpace, boardSize: boardSize)
		board.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(board)
		board.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		board.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
		board.widthAnchor.constraint(equalToConstant: board.frame.width).isActive = true
		board.heightAnchor.constraint(equalToConstant: board.frame.height).isActive = true

		manager = GameLogicManager(dimension: dimension, winValue: winValue)
		manager.delegate = self
		manager.sourceDelegate = self

		renderer = GameBoardRenderer(board: board)

		let scoreSize = CGSize(width: 100, height: 50)
		score = Score(frame: CGRect(origin: CGPoint.zero, size: scoreSize))
		score.value = ModelController.shared.loadCurrentScore(for: dimension)
		score.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(score)
		score.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
		score.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -extraSpace).isActive = true
		score.widthAnchor.constraint(equalToConstant: score.frame.width).isActive = true
		score.heightAnchor.constraint(equalToConstant: score.frame.height).isActive = true

		highScore = HighScore(frame: CGRect(origin: CGPoint.zero, size: scoreSize))
		highScore.value = ModelController.shared.loadHighScore(for: dimension)
		highScore.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(highScore)
		highScore.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
		highScore.trailingAnchor.constraint(equalTo: score.leadingAnchor, constant: -extraSpace).isActive = true
		highScore.widthAnchor.constraint(equalToConstant: highScore.frame.width).isActive = true
		highScore.heightAnchor.constraint(equalToConstant: highScore.frame.height).isActive = true

		restartButton = RestartButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: scoreSize.width, height:
		scoreSize.height * 0.6)))
		restartButton.translatesAutoresizingMaskIntoConstraints = false
		restartButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
		self.view.addSubview(restartButton)
		restartButton.topAnchor.constraint(equalTo: score.bottomAnchor, constant: extraSpace).isActive = true
		restartButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -extraSpace).isActive = true
		restartButton.widthAnchor.constraint(equalToConstant: restartButton.frame.width).isActive = true
		restartButton.heightAnchor.constraint(equalToConstant: restartButton.frame.height).isActive = true
        
        logoutButton = LogOutButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: scoreSize.width, height:
            scoreSize.height * 0.6)))
        
        logoutButton .translatesAutoresizingMaskIntoConstraints = false
         logoutButton.addTarget(self, action: #selector(Logout), for: .touchUpInside)
        self.view.addSubview( logoutButton )
         logoutButton .topAnchor.constraint(equalTo: score.bottomAnchor, constant: extraSpace).isActive = true
         logoutButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -extraSpace - 5).isActive = true
         logoutButton.widthAnchor.constraint(equalToConstant:  logoutButton .frame.width).isActive = true
         logoutButton .heightAnchor.constraint(equalToConstant:  logoutButton .frame.height + 5).isActive = true
	}

	private func clearSubviews() {
		self.view.subviews.forEach({ $0.removeFromSuperview() })
	}
}

