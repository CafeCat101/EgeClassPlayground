//
//  ExtendContentView.swift
//  EgeClassPlayground
//
//  Created by Leonore Yardimli on 2022/6/2.
//

import Foundation
import SwiftUI

extension ContentView {
	func multiTextView3(sentence:String)->Text {
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
	}
	
	func multiTextView4(sentence:String, highlight:Int)->Text {
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
	}
	
	func multiTextView5(sentence:String, addWordAt:Int)->Text {
		let stringArray = sentence.components(separatedBy: "-")
		var stringToTextView = Text("")
		
		if addWordAt >= 0 && addWordAt < stringArray.count {
			for (index, item) in stringArray.enumerated() {
				if index > addWordAt {
					break
				} else {
					if index < addWordAt {
						stringToTextView = stringToTextView + Text(item)
					} else {
						stringToTextView = stringToTextView + Text(item).bold()
					}
				}
			}
		} else {
			if addWordAt >= stringArray.count {
				for item in stringArray{
					stringToTextView = stringToTextView + Text(item)
				}
			}
		}
		
		return stringToTextView
	}
	
	@ViewBuilder
	func fetchView() -> some View {
		Text("\(placeSentence2)")
		Button("Btn", action: {
			placeSentence2 = "Changed from extension"
		})
	}
}
