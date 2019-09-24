import UIKit
//aka Audio Visual Foundation. This is used to import the sound functions
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playSound(soundFileName: soundArray[sender.tag - 1])
    }
    
    func playSound(soundFileName : String) {
        // This let soundURL sets up the location of where our sound is
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        // This is like opening a CD player and placing in that cd...
        // AVAudioplayer class is a declariation where it tries to play a certain sound from the URL I declared in soundURL. The only thing is that there is a possibility that the file is missing, or corrupted, in which case it will throw an error. This is why I included a "do", "try", and "catch". Do simply describes what commmand Im trying to achieve, and catch essentially... catches the error. If I tried running audioPlayer without Do/Catch, the code wouldn't run. We can override it with try!audioPlayer = AVAudioPlayer(contentsOf: soundURL!).
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }

}

