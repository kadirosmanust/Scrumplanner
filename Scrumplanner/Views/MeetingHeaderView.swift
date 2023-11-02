import SwiftUI


struct MeetingHeaderView : View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme : Theme
    private var totalSecond : Int{
        secondsElapsed + secondsRemaining
    }
    private var progress : Double{
        guard totalSecond > 0 else {return 1 }
        
        return Double(secondsElapsed) / Double(secondsRemaining)
    }
    private var minutesRemaining: Int{
        return secondsRemaining / 60
    }
    var body: some View {
        VStack{
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack{
                VStack{
                    Text("Second Elapsed").font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack{
                    Text("Second Reminder").font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
               .accessibilityLabel("Time remaining")
               .accessibilityValue("\(minutesRemaining) minutes")
               .padding([.top, .horizontal ])
    }
}


struct MeetingHeaderView_Previews: PreviewProvider{
    static var previews: some View{
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
