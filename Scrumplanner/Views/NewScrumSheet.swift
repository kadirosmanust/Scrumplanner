import SwiftUI

struct NewScrumSheetView : View {
    @State var newScrum : DailyScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView : Bool
    var body: some View {
        NavigationStack{
            DetailEditView(scrum: $newScrum)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Dismiss"){
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Add"){
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
       
    }
}


struct NewScrumSheetView_Providers : PreviewProvider {
    static var previews: some View{
        NewScrumSheetView(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
    }
}
