//
//  TrafficLightController.swift
//  HW2.1
//
//  Created by Алексей Маслобоев on 29.01.2020.
//

import UIKit

class TrafficLightController: UIViewController {

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightLabel: UIView!
    @IBOutlet weak var greenLightLabel: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    var lightViews: [UIView] = []
    var lightIndex = -1
    let defaultOpacity: Float = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func nextAction() {
        nextButton.setTitle("NEXT", for: .normal)
        resetAllLights()
        lightIndex = getNextIndex(lightIndex)
        lightViews[lightIndex].layer.opacity = 1
    }
    
    private func setupUI() {
        setupLightView(view: redLightView, color: UIColor.red)
        setupLightView(view: yellowLightLabel, color: UIColor.yellow)
        setupLightView(view: greenLightLabel, color: UIColor.green)
        
        nextButton.layer.cornerRadius = 15
    }
    
    private func setupLightView(view: UIView, color: UIColor) {
        view.layer.opacity = defaultOpacity
        view.backgroundColor = color
        view.layer.cornerRadius = view.frame.size.width / 2
        
        lightViews.append(view)
    }
    
    private func resetAllLights() {
        for view in lightViews {
            view.layer.opacity = defaultOpacity
        }
    }
    
    private func getNextIndex(_ index: Int) -> Int {
        var nextIndex = index + 1
        if (nextIndex > lightViews.count - 1) {
            nextIndex = 0
        }
        return nextIndex
    }
}
