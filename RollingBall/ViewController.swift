//
//  ViewController.swift
//  RollingBall
//
//  Created by Nhật Minh on 11/25/16.
//  Copyright © 2016 Nhật Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ball = UIImageView()
    
    var radians  = CGFloat()
    
    var ballRadiuos = CGFloat()
    
    var right = true
    
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(changeDirection), userInfo: nil, repeats: true)
        addBall()
        
    }

    
    func addBall()
    {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadiuos = 32.0
        ball.center = CGPoint(x: ballRadiuos , y: mainViewSize.height * 0.5)
        self.view.addSubview(ball)
    }
    
    func changeDirection()
    {
        
        if right
        {
            rollBall()
        }
        else
        {
            ballRoll()
        }
        
    }
    
    func rollBall()
    {
        
        let deltaAngle: CGFloat = 0.1
        radians = radians + deltaAngle
        ball.transform = CGAffineTransform(rotationAngle: radians)
        ball.center = CGPoint(x: ball.center.x + ballRadiuos * deltaAngle, y: ball.center.y)
        if ball.center.x + ballRadiuos > self.view.bounds.size.width
        {
            right = false
        }
        
    }
    
   func ballRoll()
   {
    
        let deltaAngle: CGFloat = -0.1
        radians = radians + deltaAngle
        ball.transform = CGAffineTransform(rotationAngle: radians)
        ball.center = CGPoint(x: ball.center.x + ballRadiuos * deltaAngle, y: ball.center.y)
        if ball.center.x - ballRadiuos < 0
        {
            right = true
        }
    
    
    }
    
            
    

}

