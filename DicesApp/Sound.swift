//
//  Sound.swift
//  DetectingShakes
//
//  Created by Jesús  Fortuna on 15/08/2020.
//

import Foundation
import AVFoundation

 class Sounds {

   static var audioPlayer:AVAudioPlayer?

   static func playSounds(soundfile: String) {

       if let path = Bundle.main.path(forResource: soundfile, ofType: nil){

           do{

               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayer?.prepareToPlay()
               audioPlayer?.play()

           }catch {
               print("Error")
           }
       }
       else{
            print("No existe")

       }
    }
 }
