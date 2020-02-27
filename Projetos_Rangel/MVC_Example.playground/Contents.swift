import UIKit



//Model

public struct Carro{
    
    public var foto: UIImage
    public var modelo: String
    public var marca: String
    public var ano: String
}


//View
public final class CarroView: UIView{
    
    @IBOutlet weak var carroImage: UIImageView!
    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
}


//Controller
public final class CarroController: UIViewController{
    
    
    //o didset aqui é um exemplo de como a model pode comunicar com a controller para uma atualizaçao
    //o exemplo da view se comunicar seria por exemplo criar IBActions
    public var carro: Carro?{
        didSet{
            updateView()
        }
    }
     
    public var carroView: CarroView! {
        guard isViewLoaded else { return nil }
        return (view as! CarroView)
      }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //o trabalho de popular a view com os models é da controler
    func updateView(){
        guard let view = carroView, let carro = carro else {
            return
        }
        view.carroImage.image = carro.foto
        view.modeloLabel.text = carro.modelo
        view.marcaLabel.text = carro.marca
        view.anoLabel.text = carro.ano
    }
}

