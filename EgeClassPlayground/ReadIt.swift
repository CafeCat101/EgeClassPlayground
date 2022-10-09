//
//  ReadIt.swift
//  EgeClassPlayground
//
//  Created by Leonore Yardimli on 2022/6/23.
//

import SwiftUI

struct ReadIt: View {
	@State private var placeSentence = "Pingu -and -Pinga -are -playing -skittles. -Pinga -takes -the -first -throw, -but -does -not -score. -Then -she -rolls -herself -up -and -knocks -all -the -skittles -down. -Pingu -sternly -tells -Pinga -that -she -is -not -allowed -to -do -that -when -Pingo -arrives -and -starts -playing -properly.-\n\nSoon -Pingo -comes -along -and -the -game -begins. -He -has -his -go -and -knocks -down -two -skittles. -Pingu -throws -and -hits -four. -On -their -next -throw, -Pingo -only -gets -one, -and -Pingu -gets -four -again. -Then -Pingo -gets -two, -and -Pingu -gets -three. -By -this -point, -Pingu's -winning -is -starting -to -get -Pingo -a -bit -aggravated.-\n\nThen -Pingu's -Grandpa -comes -along -to -have -a -go -and -knocks -six -down. -On -Pingu’s -next -go, -the -ball -knocks -one -skittle -over, -but -it -stands -back -up -again. -Then -Grandpa -gets -another -six -and -Pingu -only -gets -a -one. -Pingo -and -Pinga -are -amazed, -but -Pingu -is -beginning -to -feel -a -bit -depressed -at -suddenly -starting -to -lose. -When -Grandpa -knocks -seven -down, -Pingu -feels -like -not -playing -anymore -and -he -wanders -off -unhappily.\n\nhen -Robby -arrives -and -takes -over -the -match -against -Grandpa. -Grandpa -gets -eight -skittles -down -and -Robby -only -knocks -down -one, -taking -an -odd -path -as -it -goes. -Robby -thinks -this -is -very -funny. -Grandpa -then -gets -a -strike -and -the -others -applaud -him. -Robby’s -next -throw -misses -completely -and -rolls -against -the -wall, -making -him -roll -over -with -laughter. -Soon -they -find -the -funny -side -of -losing -and -Pingo -completely -misses -on -purpose. -Then -Pingu -bowls -facing -backwards -and -the -ball -rolls -between -his -legs. -The -ball -knocks -against -the -side -and -rolls -right -around -the -skittles. -He -has -another -throw -and -the -second -ball -hits -the -first -one -and -the -both -of -them -go -round -the -outside -of -the -group -of -skittles. -Pingu, -Pinga, -Grandpa, -Pingo, -and -Robby -all -laugh -ecstatically."
	@State private var composeWordIndex = -1
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				Spacer()
				multiTextView5(sentence: placeSentence, addWordAt: composeWordIndex)
					.font(.largeTitle)
	
				Spacer()
			}
			
			Button("Read it") {
				composeWordIndex = composeWordIndex + 1
				print(composeWordIndex)
			}
			Spacer()
		}
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
}

struct ReadIt_Previews: PreviewProvider {
	static var previews: some View {
		ReadIt()
	}
}
