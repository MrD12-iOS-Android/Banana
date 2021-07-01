//
//  Apple.swift
//  Banana
//
//  Created by Oybek Iskandarov on 4/1/21.
//

import UIKit

class Apple: UIViewController {
    struct Apples {
        var one : Int
        var two : Int
        var javob : Int{
            return one + two
        }
        var variantlar: [Int]
    }
    
    @IBOutlet weak var animate: UIView!
    @IBOutlet var top_img: [UIImageView]!
    @IBOutlet var bottom_img: [UIImageView]!
    @IBOutlet weak var finish_view: UIView!
    @IBOutlet weak var natija_label: UILabel!
    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var restart_btn: UIButton!
    @IBOutlet var answer: [UIButton]!
    @IBOutlet weak var next_btn: UIButton!
    @IBOutlet weak var xato_javoblar: UILabel!
    
    
    var array : [Apples] = []
    var joriy_savol = 0
    var hisob_next = 0
    var natija_hisob = 0
    var over_hisob = 0
    
    var bir = Apples(one: 2, two: 2, variantlar: [4,5,1,7])
    var ikki = Apples(one: 3, two: 3, variantlar: [3,1,5,6])
    var uch = Apples(one: 3, two: 1, variantlar: [10,4,9,2])
    var tort = Apples(one: 1, two: 3, variantlar: [4,3,1,7])
    var besh = Apples(one: 1, two: 1, variantlar: [2,5,1,9])
    var olti = Apples(one: 3, two: 2, variantlar: [4,5,11,71])
    var yetti = Apples(one: 2, two: 2, variantlar: [4,5,11,7])
    var sakkiz = Apples(one: 1, two: 2, variantlar: [3,5,1,7])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finish_view.isHidden = true
        
        for i in 0...3 {
            top_img[i].isHidden = true
            bottom_img[i].isHidden = true
        }
        
        array = [bir, ikki, uch, tort, besh, olti, yetti, sakkiz]
        
        for i in 0...3 {
            answer[i].setTitle(String(array[0].variantlar[0]), for: .normal)
        }
        setQuestion()
    }
    
    
    func setQuestion(){
        if joriy_savol > 5 {
            joriy_savol = 0
        }
        for i in 0..<4 {
            print("a\(i)")
            answer[i].setTitle(String(array[joriy_savol].variantlar[i]), for: .normal)
        }
        for i in 0..<array[joriy_savol].one{
            top_img[i].isHidden = false
            print("one_img\(i)")
        }
        for i in 0..<array[joriy_savol].two{
            bottom_img[i].isHidden = false
            print("bottom_img\(i)")
        }
    }
    
    @IBAction func next_pressed(_ sender: Any) {
        next_btn.isEnabled = false
        for i in 0...3 {
            answer[i].isEnabled = true
        }
        hisob_next += 1
        
        if hisob_next == 8 {
            finish_view.isHidden = false
            natija_label.text = "\(natija_hisob)"
        }
        
        for i in 0...3 {
            answer[i].setTitleColor(.white, for: .normal)
        }
        
        for i in 0...3 {
            top_img[i].isHidden = true
            bottom_img[i].isHidden = true
        }
        
        
        joriy_savol += 1
        setQuestion()
    }
    
    @IBAction func answer_Pressed(_ sender: UIButton) {
        
        next_btn.isEnabled = true
        if Int(answer[sender.tag].currentTitle!) == array[joriy_savol].javob{
            answer[sender.tag].setTitleColor(.green, for: .normal)
            natija_hisob += 1
            natija_label.text = "\(natija_hisob)/\(array.count)"
            for i in 0...3 {
                answer[i].isEnabled = false
            }
            
            // Animation
            UIView.animate(withDuration: 0.001){
                self.animate.transform = .init(scaleX: 0.001, y: 0.001)
            }completion: { (_) in
                UIView.animate(withDuration: 4){
                    self.animate.transform = .identity
                }
            }
        }else{
            for i in 0...3 {
                answer[i].isEnabled = false
            }
            over_hisob += 1
            xato_javoblar.text = "\(over_hisob)"
            xato_javoblar.textColor = .red
            answer[sender.tag].setTitleColor(.red, for: .normal)
            for i in 0..<answer.count where Int(answer[i].currentTitle!) == array[joriy_savol].javob{
                answer[i].setTitleColor(.green, for: .normal)
            }
        }
    }
    @IBAction func restart(_ sender: Any) {
        finish_view.isHidden = true
        hisob_next = 0
        natija_hisob = 0
        over_hisob = 0
    }
    
    @IBAction func home(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    
    
    
    

}
