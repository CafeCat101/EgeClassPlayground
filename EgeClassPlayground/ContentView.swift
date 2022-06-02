//
//  ContentView.swift
//  EgeClassPlayground
//
//  Created by Leonore Yardimli on 2022/4/25.
//

import SwiftUI

struct ContentView: View {
	@State private var placeSentence = "我-們-要-去-辦-公-室。"
	@State private var highlightWordIndex = -1
	@State private var composeWordIndex = -1
	var body: some View {
		VStack {
			Spacer()
			
			/*HStack {
				Spacer()
				multiTextView(sentence: "There is a thunderstorm in the area")
				Spacer()
			}*/
			//multiTextView2(sentence: "我-們-要-去-辦-公-室。")
			//multiTextView3(sentence: "我-們-要-去-辦-公-室。")
			//Spacer().frame(height:10)
			
			HStack {
				Spacer()
				multiTextView4(sentence: placeSentence, highlight: highlightWordIndex)
					.font(.title2)
				Spacer()
			}
			Button("Tap me") {
				highlightWordIndex = highlightWordIndex + 1
				print(highlightWordIndex)
			}
			
			Spacer().frame(height:20)
			HStack {
				Spacer()
				multiTextView5(sentence: placeSentence, addWordAt: composeWordIndex)
					.font(.title2)
				Spacer()
			}
			Button("Read it") {
				composeWordIndex = composeWordIndex + 1
				print(composeWordIndex)
			}
			
			Spacer()
		}
		
	}
	
	func multiTextView(sentence:String)->Text {
		let testo : String = sentence
		let stringArray = testo.components(separatedBy: " ")
		let stringToTextView = stringArray.reduce(Text(""), {
			if $1 == "thunderstorm" {
				return $0 + Text($1).bold() + Text(" ")
			} else {
				return $0 + Text($1) + Text(" ")
			}
			
		})
		return stringToTextView
	}
	
	func multiTextView2(sentence:String)->Text {
		let testo : String = sentence
		let stringArray = testo.components(separatedBy: "-")
		let stringToTextView = stringArray.reduce(Text(""), {
			if $1 == "我" {
				print("found the word.")
				return $0 + Text($1).bold() + Text("")
			} else {
				print($0)
				return $0 + Text($1) + Text("")
			}
			
		})
		return stringToTextView
	}
	
	/*func multiTextView3(sentence:String)->Text {
		let testo : String = sentence
		let stringArray = testo.components(separatedBy: "-")
		var stringToTextView = Text("-")
		for (index,item) in stringArray.enumerated() {
			if index == 1 {
				stringToTextView = stringToTextView + Text(item).bold()
			} else {
				stringToTextView = stringToTextView + Text(item)
			}
		}
		return stringToTextView
	}*/
	
	/*func multiTextView4(sentence:String, highlight:Int)->Text {
		let stringArray = sentence.components(separatedBy: "-")
		var stringToTextView = Text("")
		
		if highlight >= 0 && highlight<stringArray.count {
			for (index,item) in stringArray.enumerated() {
				if index == highlight {
					if highlight == 0 {
						stringToTextView = Text(item).bold().foregroundColor(Color.red)
					} else {
						stringToTextView = stringToTextView + Text(item).bold().foregroundColor(Color.red)
					}
				} else {
					stringToTextView = stringToTextView + Text(item)
				}
			}
		} else {
			for item in stringArray{
				stringToTextView = stringToTextView + Text(item)
			}
		}
		return stringToTextView
	}*/
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
