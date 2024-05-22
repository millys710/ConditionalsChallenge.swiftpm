import SwiftUI

struct ContentView: View {
    @State var clothingItems:[ClothingItem] = []
    @State var totalMoney = 0
    @State var displayMoney = 0
    @State var firstChoiceCost = 0
    @State var secondChoiceCost = 0
    @State var thirdChoiceCost = 0
    @State var fourthChoiceCost = 0
    @State var selectedSegment = 0
    @State var output = ""
    @State var stringToReturn: String = ""
    
    
    var body: some View {
        VStack {
            Group {
                Divider()
                Text("Conditionals Challenge")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
                Divider()
            }
            VStack {
                Text("Use the lines on the right to move the items into the order that you would like, then select which challenge you would like to test. Press the refresh button multiple times to test all possibilities")
                    .multilineTextAlignment(.center)
                Divider()
                HStack {
                    Text("You have $\(displayMoney)")
                    
                    Button { 
                        setInfo()
                        switch selectedSegment
                        {
                        case 0:
                            output = determineOutputMVP()
                        case 1:
                            output = determineOutput1()
                        case 2:
                            output = determineOutput2()
                        case 3:
                            output = determineOutput3()
                        case 4:
                            output = determineOutput4()
                        case 5:
                            output = determineOutput5()
                        default:
                            print("Error")
                        }
                    } label: { 
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(.largeTitle)
                    }
                }
                
                List {
                    ForEach(0..<clothingItems.count, id: \.self) { index in
                        HStack {
                            Text(clothingItems[index].description)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20, alignment: .center)
                            Text("$\(clothingItems[index].price)")
                        }
                    }
                    .onMove(perform: { indices, newOffset in
                        clothingItems.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    Picker("Which Selection?", selection: $selectedSegment) {
                        Text("MVP").tag(0)
                        Text("Stretch1").tag(1)
                        Text("Stretch2").tag(2)
                        Text("Stretch3").tag(3)
                        Text("Stretch4").tag(4)
                        Text("Stretch5").tag(5)
                    }
                    .pickerStyle(.segmented)
                    
                }
                Group {
                    Divider()
                Text(output)
                    .frame(maxHeight:.infinity)
                    .lineLimit(nil)
                    Divider()
                }
                Group {
                    Image("MobileMakersEduNB")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                }
                .padding()
            }
            .onAppear() {
                clothingItems.append(ClothingItem(Description: "Jacket", Price: 80))
                clothingItems.append(ClothingItem(Description: "Jeans", Price: 60))
                clothingItems.append(ClothingItem(Description: "Shirt", Price: 40))
                clothingItems.append(ClothingItem(Description: "Hat", Price: 20))
                
                setInfo()
            }
            .environment(\.editMode, .constant(.active))
        }
    }
    
    func setInfo()
    {
        totalMoney = Int.random(in: 0...11) * 20
        displayMoney = totalMoney
        stringToReturn = ""
        firstChoiceCost = clothingItems[0].price
        secondChoiceCost = clothingItems[1].price
        thirdChoiceCost = clothingItems[2].price
        fourthChoiceCost = clothingItems[3].price
    }
    
    func determineOutputMVP() -> String
    {
        setInfo()
        // MARK: - MVP
        if totalMoney >= firstChoiceCost {
            stringToReturn = "You can purchase your first choice."
        }else {
            stringToReturn = "You can't purchase your first choice."
        }
        
        
        return stringToReturn
    }
    
    func determineOutput1() -> String
    {
        setInfo()
        // MARK: - Stretch #1
        if totalMoney > firstChoiceCost {
            stringToReturn = "You have plenty of money for your first choice."
            
        }else if totalMoney == firstChoiceCost {
            stringToReturn = "You have just enough money for your first choice."
            
        }else {
            stringToReturn = "You do not have enough money for your first choice."
        }
        
        
        
        
        return stringToReturn
    }
    
    func determineOutput2() -> String
    {
        setInfo()
        // MARK: - Stretch #2
        if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost {
            stringToReturn = "You can purchase your first, second, third and fourth choice."
        } 
       else if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost {
            stringToReturn = "You can purchase your first, second, and third choice."
        } 
     else if totalMoney >= firstChoiceCost + secondChoiceCost {
            stringToReturn = "You can purchase your first and second choice."
        } 
     else if totalMoney >= firstChoiceCost {
            stringToReturn = "You can purchase your first choice."
        } else{
            stringToReturn = "You can't purchase anything."
        }
        return stringToReturn
    }
    
    func determineOutput3() -> String
    {
        setInfo()
        // MARK: - Stretch #3
        if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost {
            stringToReturn = "You can purchase your first, second, third and fourth choice."
        } 
        else if totalMoney >= firstChoiceCost + secondChoiceCost + thirdChoiceCost {
            stringToReturn = "You can purchase your first, second, and third choice. You can't purchase your fourth choice."
        } 
        else if totalMoney >= firstChoiceCost + secondChoiceCost {
            stringToReturn = "You can purchase your first and second choice. You can't purchase your third or fourth choice."
        } 
        else if totalMoney >= firstChoiceCost {
            stringToReturn = "You can purchase your first choice. You can't purchase your second, third or fourth choice."
        } else{
            stringToReturn = "You can't purchase anything."
        }
        return stringToReturn
    }
    
    func determineOutput4() -> String
    {
        setInfo()
        // MARK: - Stretch #4
        
        
        
        
        return stringToReturn
    }
    
    func determineOutput5() -> String
    {
        setInfo()
        // MARK: - Stretch #5
        
        
        
        
        return stringToReturn
    }
}
