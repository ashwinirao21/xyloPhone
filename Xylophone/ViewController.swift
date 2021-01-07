import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var soundName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {

        playSound(playSound: sender.currentTitle!)
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1 //reset back to original to give a blinking effect
        }
    }
    
    func playSound(playSound: String) {
        let url = Bundle.main.url(forResource: playSound, withExtension: "wav") //find C.wav file frpm project resources
        player = try! AVAudioPlayer(contentsOf: url!) //assign the file to the player
        player.play()//play the file
                
    }
}
