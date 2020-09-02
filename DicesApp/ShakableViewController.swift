//
//  ShakableViewController.swift
//  DetectingShakes
//
//  Created by Jesús  Fortuna on 02/08/2020.
//

import Foundation
import SwiftUI
import Combine

let messagePublisher = PassthroughSubject<Void,Never>()

class ShakableViewController : UIViewController {
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        
        // Use the publisher to notfy the SwiftUI View
        messagePublisher.send()
    }
}

// Conver the UIViewController into a UIViewControllerRepresentable for using it inside the SwiftUI View

struct ShakaViewRepresentable : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) ->
        ShakableViewController{
            ShakableViewController()
        }
    func updateUIViewController(_ uiViewController: ShakableViewController, context: Context) {
        
    }
}
