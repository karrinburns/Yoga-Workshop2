//
//  ViewController.swift
//  Yoga Workshop
//
//  Created by BurnsK on 3/13/18.
//  Copyright © 2018 BurnsK. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let elements = ["frustrated","overexcited","angry","sad","tired","stressed","happy"]
    let moods = ["Frustrated","Overexcited","Angry","Sad","Tired","Stressed","Happy"]


    @IBOutlet weak var tableView: UITableView!
    
    var mood = [Moods]()
 
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let frustrated = Moods(name: "Frustrated", descriptionA: "SIDE PLANK: Side plank helps relax the feelings and encourages calm. Side plank is also called Vasisthasana (VAH-shees-THAH- suh- nah). It’s name comes from the Sanskrit word Vasistha, which means most excellent/best.", descriptionB: "LION POSE: Lion pose helps get all frustrated feelings out by roaring. The pose opens your throat, jaw, and neck which can help with your jaw and neck pain. It also stretches your face muscles and your chest! The silliness of the pose can help boost your confidence because the pose teaches to let go of what others think!")
        
        mood.append(frustrated)
        
        let overexcited = Moods(name: "Overexcited", descriptionA: "To do Cobra, lie down on your stomach.  Pull your head up!", descriptionB: "Hi")
        mood.append(overexcited)
        
        let angry = Moods(name: "Angry", descriptionA: "To do Cobra, lie down on your stomach.  Pull your head up!", descriptionB: "Hi")
        mood.append(angry)
        
        let sad = Moods(name: "Sad", descriptionA: "CHILD'S POSE: also called balasana (bah-LAHS-uh-nuh). Child’s pose helps you stretch your hips,thighs, and ankles. It also lowers stress. Child’s pose centers,calms, and soothes your brain, making it a pose for relieving stress. Always work in the range of your limits and abilities.", descriptionB: "CAMEL POSE: The camel pose is often used as a preparation for deeper backbends in your body when you do the camel pose you should feel your back get relaxed as you do the camel pose, while also strengthening the muscles and improving posture in the chest and lungs. The camel pose stretches the front of your body so it might look like you are kneeling and bending your belly like the picture shows you. The camel pose can also increase breathing capacity and help to relieve respiratory ailments in your body! You can do the camel pose if you also just want to stretch your back for fun to!")
        mood.append(sad)
        
        let tired = Moods(name: "Tired", descriptionA: "To do Cobra, lie down on your stomach.  Pull your head up!", descriptionB: "Hi")
        mood.append(tired)
        
        let stressed = Moods(name: "Stressed", descriptionA: "WARRIOR: Warrior helps you be more calm and it helps you balance your thoughts more. Warrior is also called Virabhadrasana (veer-uh- buh- DRAHS-uh). It is a standing yoga pose. This pose is named after the Hindu mythological warrior.", descriptionB: "CORPSE POSE: also called final relaxation pose.")
        mood.append(stressed)
        
        let happy = Moods(name: "Happy", descriptionA: "To do Cobra, lie down on your stomach.  Pull your head up!", descriptionB: "Hi")
        mood.append(happy)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        
        cell.moodLbl.text = moods[indexPath.row]
        cell.moodImage.image = UIImage(named: elements[indexPath.row])
        cell.moodImage.layer.cornerRadius = cell.moodImage.frame.height / 2
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = indexPath.row
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MoodViewController {
            destination.mood = mood[(tableView.indexPathForSelectedRow?.row)!]
            
        }
    }
    
}



