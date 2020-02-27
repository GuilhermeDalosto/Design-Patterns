import UIKit


//aqui vamos fazer um simples exemple de como funciona a arquiterua MVVM
//Sua base é o MVC e ela traz uma alternativa para o problema existente com o MVC que são as Controllers gigantescas. No MVVM inlcui um tipo MODEL_VIEW, geralmente são classes para poder reultilizar no código. Sua função é transformar os dados da Model para que possam ser apresentando de forma corretar na View, toda lógica de formatar data, dinheiro e outros tipos de dados entram aqui


//  Model : aqui temos um simples model q será mostrado numa view. Porém rarity e birthday não estão no fomato apropriado para ser mostrado, aqui que irá entrar a Model_View
public class Pet {
  public enum Rarity {
    case common
    case uncommon
    case rare
    case veryRare
  }
  
  public let name: String
  public let birthday: Date
  public let rarity: Rarity
  public let image: UIImage
  
  public init(name: String,
              birthday: Date,
              rarity: Rarity,
              image: UIImage) {
    self.name = name
    self.birthday = birthday
    self.rarity = rarity
    self.image = image
  }
}



// ViewModel: Aqui fazemos  criamos a lógica de formatação tanto do anivesário e rarity da nossa model
public class PetViewModel {
  
  
  private let pet: Pet
  private let calendar: Calendar
  
  public init(pet: Pet) {
    self.pet = pet
    self.calendar = Calendar(identifier: .gregorian)
  }
  
  
  public var name: String {
    return pet.name
  }
  
  public var image: UIImage {
    return pet.image
  }
  
  public var ageText: String {
    let today = calendar.startOfDay(for: Date())
    let birthday = calendar.startOfDay(for: pet.birthday)
    let components = calendar.dateComponents([.year],
                                             from: birthday,
                                             to: today)
    let age = components.year!
    return "\(age) years old"
  }
  
  public var adoptionFeeText: String {
    switch pet.rarity {
    case .common:
      return "$50.00"
    case .uncommon:
      return "$75.00"
    case .rare:
      return "$150.00"
    case .veryRare:
      return "$500.00"
    }
  }
}

//
public class PetView: UIView {
  public let imageView: UIImageView
  public let nameLabel: UILabel
  public let ageLabel: UILabel
  public let adoptionFeeLabel: UILabel
  
  public override init(frame: CGRect) {
    
    var childFrame = CGRect(x: 0, y: 16,
                            width: frame.width,
                            height: frame.height / 2)
    imageView = UIImageView(frame: childFrame)
    imageView.contentMode = .scaleAspectFit
    
    childFrame.origin.y += childFrame.height + 16
    childFrame.size.height = 30
    nameLabel = UILabel(frame: childFrame)
    nameLabel.textAlignment = .center
    
    childFrame.origin.y += childFrame.height
    ageLabel = UILabel(frame: childFrame)
    ageLabel.textAlignment = .center
    
    childFrame.origin.y += childFrame.height
    adoptionFeeLabel = UILabel(frame: childFrame)
    adoptionFeeLabel.textAlignment = .center
    
    super.init(frame: frame)
    
    backgroundColor = .white
    addSubview(imageView)
    addSubview(nameLabel)
    addSubview(ageLabel)
    addSubview(adoptionFeeLabel)
  }
  
  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init?(coder:) is not supported")
  }
}
