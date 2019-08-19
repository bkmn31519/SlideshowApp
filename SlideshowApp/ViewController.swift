import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var next2Image: UIButton!
    @IBOutlet weak var return2Image: UIButton!
    @IBOutlet weak var startStop2Image: UIButton!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.sendText = self.imageView.image!
    }
    @IBAction func Tap(_ sender: Any) {
        performSegue(withIdentifier: "result",sender: nil)
    }
    var timer : Timer!
    @IBAction func returnImage(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
    @IBAction func nextImage(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    //再生・停止ボタン
    @IBAction func startStopImage(_ sender: Any) {
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector : #selector(wakaran), userInfo: nil, repeats :true)
        return2Image.isEnabled = false
        next2Image.isEnabled = false
            startStop2Image.setTitle("停止", for: .normal)
        }else if self.timer != nil{
//            タイマー停止
            self.timer.invalidate()
//            nilにして再び再生
            self.timer = nil
            return2Image.isEnabled = true
            next2Image.isEnabled = true
            startStop2Image.setTitle("再生", for: .normal)
            
        }
    }
    @objc func wakaran(){
        dispImageNo += 1
        displayImage()
        
    }
    var dispImageNo = 0
    func  displayImage(){
    let imageNameArray = ["image1","image2","image3"]
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        if dispImageNo > 2 {
            dispImageNo = 0
        }
    let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    
    override func viewDidLoad() {
        let image = UIImage(named:"image1")
        imageView.image = image
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        @IBAction func unwind(_ segue: UIStoryboardSegue){
            
    }
}


