
import UIKit
import CoreData

class GeneratorViewController: UIViewController {
//MARK: -View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSetup()
        loadArray()
    }//end viewDidLoad

    //MARK: -Setup Methods
    func nameSetup(_ sender: String = "blueButton"){
        let first: String; let last: String;
        let title1: String; let title2: String;
        
        let r1 = Int.random(in: 0..<30)
        let r2 = Int.random(in: 0..<30)
        let r3 = Int.random(in: 0..<30)
        let r4 = Int.random(in: 0..<30)
        
        switch sender{
        case "blueButton":
            first = generatedName.fMaleArray[r1]
            break
        case "redButton":
            first = generatedName.fFemaleArray[r1]
            break
        default:
            first = generatedName.fUnisexArray[r1]
        }
        
        
        last = generatedName.lArray[r2]
        nameLabel.text = first + " " + last
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.adjustsFontSizeToFitWidth = true
        
        title1 = generatedName.t1Array[r3]
        title2 = generatedName.t2Array[r4]
        fullTitle.text = title1 + "\n" + title2
        alertName = first + " " + last + " the " + title1 + " " + title2

    }//end nameSetup
    
    //MARK: -Delegate Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TableViewController
            destinationVC.nameArray = tableArray
            
    }//prepare method
    
    
    //MARK: -Model Manipulation Methods
    func saveData(){
        do{
            try context.save()
        }catch{
            print("error saving data, \(error)")
        }
    }//end saveData
    
    func loadArray(){
        let request: NSFetchRequest<GeneratedName> = GeneratedName.fetchRequest()
        do {
            tableArray = try context.fetch(request)
        }catch{
            print("error populating tableArray, \(error)")
        }
    }
    //MARK: -IBOutlets/Actions and Declarations

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var fullTitle: UILabel!
    @IBAction func blueButton(_ sender: UIButton) {
        nameSetup("blueButton")
    }
    @IBAction func redButton(_ sender: UIButton) {
        nameSetup("redButton")
    }
    @IBAction func purpleButton(_ sender: UIButton) {
        nameSetup("purpleButton")
    }
    @IBAction func viewSavedButton(_ sender: UIButton) {
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: alertName, message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let action = UIAlertAction(title: "Add Name", style: .default){
        [self] (action) in
            
            let newName = GeneratedName(context: self.context)
            
            newName.name = alertName
            print (newName.name ?? "placeholder")
            saveData()
            loadArray()
        }

        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }//end save button
    
    let generatedName = RandomName()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var alertName = ""
    var tableArray = [GeneratedName]()
}
