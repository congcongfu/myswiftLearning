//
//  lesson2.swift
//  
//
//  Created by fucong on 16/3/16.
//
//

import Foundation
let ad = (4, "hello")

var myTuples = [(2, "hello"),(1, "world"), (3, "hello")]

func getMath(trump : (Int, String) )-> String{
    
    var result : String = "did not match"
    for case (trump.0, trump.1) in myTuples{
        result = "did match"
        
    }
    print(result)
    return result
}

getMath(ad)


/**********************************************
 * Created by congfu @19/03/206 
 *
 **/

enum FCMessageType {
    case Text
    case Voice
    case Image
    case Video
}


class Message{
    let incoming: Bool
    let sentDate: NSData
    var iconName: String
    
    var messageType : FCMessageType{
        get{
            return FCMessageType.Text
        }
    }
    
    let dataString: String = {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let date = NSDate()
        let formater = NSDateFormatter()
        formater.dateFormat = "MM-dd HH:mm"
        var dateStr: String = formater.stringFromDate(date)
        return dateStr
    }()
    
    init(incoming: Bool ,sentDate : NSData ,iconName: String){
        self.incoming = incoming
        self.sentDate = sentDate
        self.iconName = iconName
        
        if incoming {
            self.iconName = "icon1"
        }else{
            self.iconName = "icon2"
        }
    }
}

class textMessage: Message{
    let text: String
    override var messageType: FCMessageType{
        get {
            return FCMessageType.Text
        }
    }
    
    init(incoming: Bool, sentDate: NSData, iconName: String, text: String) {
        self.text = text
        super.init(incoming: incoming, sentDate: sentDate, iconName: iconName)
    }
}


/*语音类
 ＊
 ＊ created by congfu @19/03/2016
 */
class voiceMessage: Message{
    let voicePath: NSURL
    let voiceName : NSNumber
    
    override var messageType: FCMessageType{
        get{
            return FCMessageType.Voice
        }
    }
    
    init(incoming: Bool, sentDate: NSData, iconName: String, voicePath: NSURL, voiceName : NSNumber) {
        self.voicePath = voicePath
        self.voiceName = voiceName
        super.init(incoming: incoming, sentDate: sentDate, iconName: iconName)
    }
    
}

/*imageClass
 * created by congfu @19/03/2016
 */

class imageMessage: Message {
    let image: UIImage
    override var messageType: FCMessageType{
        get{
            return FCMessageType.Image
        }
    }
    
    init(incoming: Bool, sentDate: NSData, iconName: String,  image: UIImage) {
        self.image = image
        super.init(incoming: incoming, sentDate: sentDate, iconName: iconName)
    }
}

/*vedioClass
 *created by congfu @19/03/2016
 */

class veidoMessage: Message {
    
    let url: NSURL
    override var messageType: FCMessageType{
        get{
            return FCMessageType.Video
        }
    }
    
    init(incoming: Bool, sentDate: NSData, iconName: String, url: NSURL) {
        self.url = url
        super.init(incoming: incoming, sentDate: sentDate, iconName: iconName)
    }
}



extension UIButton{
    class func createButton(title: String, backGroundColor: UIColor) -> UIButton{
        let button = UIButton(type: UIButtonType.Custom)
        button.setTitle(title, forState: .Normal)
        button.backgroundColor = backGroundColor
        button.setBackgroundImage(UIImage.imageWithColor(backGroundColor), forState: .Normal)
        return button
    }
}