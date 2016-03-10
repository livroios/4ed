//
//  SoundUtil.swift
//  HelloMusica
//
//  Created by Ricardo Lecheta on 7/5/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation
import AVFoundation

class SoundUtil: NSObject, AVAudioPlayerDelegate {

    var player : AVAudioPlayer?
    
    func playFile(file: String) {
        // Converte o caminho do arquivo em NSURL
        let path = NSBundle.mainBundle().pathForResource(file, ofType: nil)
        
        if(path != nil) {
            let url = NSURL.fileURLWithPath(path!)

            self.playUrl(url)
        }
    }
    
    func playUrl(url: NSURL!) {
        print("playUrl \(url)")

        if (player == nil) {
            
            do {
                // Inicializa o player com a URL do arquivo
                self.player = try AVAudioPlayer(contentsOfURL: url)
            } catch let error as NSError {
                self.player = nil
                print("Error \(error)")
                return
            }
        }

        // Se tudo está OK, configura o delegate e inicia a música
        self.player!.delegate = self
        self.player!.play()
    }
    
    func pause() {
        if(self.player != nil) {
            self.player!.pause()
        }
    }
    
    func stop() {
        if(self.player != nil) {
            self.player!.stop()
            self.player = nil
        }
    }
    
    // Fim da música
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer,successfully flag: Bool) {
        print("Fim da música");
        self.player = nil
    }
}