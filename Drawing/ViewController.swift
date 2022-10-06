//
//  ViewController.swift
//  Drawing
//
//  Created by Camilo on 10/5/22.
//

import UIKit
import PencilKit

class ViewController: UIViewController {
    
    private let canvasView: PKCanvasView = {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        return canvas
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Change Background", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let colors: [UIColor] = [
        .blue,
        .cyan,
        .gray,
        .red,
        .purple,
        .orange,
        .lightGray,
        .brown,
        .darkGray,
        .magenta,
        .green
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvasView)
        canvasView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: view.frame.size.height - 200
        )
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
    }
    
    @objc func changeColor () {
        view.backgroundColor = colors.randomElement()
        canvasView.backgroundColor = view.backgroundColor
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 25,
            y: view.frame.size.height - 200,
            width: view.frame.size.width - 50,
            height: 50
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let toolPicker = PKToolPicker()
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }

}

