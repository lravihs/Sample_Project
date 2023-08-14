//
//  iOSDatePicker.swift
//  Runner
//  Created by Gugan on 16/05/23.
//

import Flutter
import UIKit

class FLNativeDatePickerViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeDatePickerView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

class FLNativeDatePickerView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView) {
        
        let picker_baseview = UIView()
        let picker_title = UILabel()
        let date_picker = UIDatePicker()
        let ok_button = UIButton()
        let cancel_button = UIButton()

        let win  = UIApplication.shared.keyWindow
        let controller : FlutterViewController = win!.rootViewController as! FlutterViewController
        //To pass date picker value to flutter
        let channel = FlutterMethodChannel(name: "DatePicker/swift_native",
                                           binaryMessenger: controller.binaryMessenger)
        
        
        picker_baseview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 320)
        picker_title.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 50)
        date_picker.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 100)
        
        ok_button.frame = CGRect(x: UIScreen.main.bounds.midX - 120, y: 260, width: 100, height: 40)
        cancel_button.frame = CGRect(x: UIScreen.main.bounds.midX + 20, y: 260, width: 100, height: 40)
        date_picker.frame = CGRect(x: 30, y: 50, width: UIScreen.main.bounds.width, height: 100)
        picker_baseview.backgroundColor = UIColor.white
        picker_baseview.layer.cornerRadius = 10.0
        
        ok_button.setTitle("APPLY", for: .normal)
        ok_button.backgroundColor = .orange
        ok_button.setTitleColor(.white, for: .normal)
        if #available(iOS 14.0, *) {
        let ok_action = UIAction{
            action in
            DispatchQueue.main.async {
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "yyyy/MM/dd"
                let selectedDate = dateFormatterGet.string(from: date_picker.date)
                channel.invokeMethod("iOSGetSelectedDate", arguments: "\(selectedDate)")
            }
        }
        ok_button.addAction(ok_action, for: .touchUpInside)
        }
        ok_button.layer.cornerRadius = 10.0
        
        cancel_button.backgroundColor = .orange
        cancel_button.setTitleColor(.white, for: .normal)
        cancel_button.setTitle("CANCEL", for: .normal)

        if #available(iOS 14.0, *) {
          let cancel_action = UIAction{
                    action in
              DispatchQueue.main.async {
                  channel.invokeMethod("iOSGetSelectedDate", arguments: "close")
              }
                }
            cancel_button.addAction(cancel_action, for: .touchUpInside)
        }
        cancel_button.layer.cornerRadius = 10.0
        
        picker_title.text = "DATE OF BIRTH"
        picker_title.textColor = .orange
        picker_title.textAlignment = .center
        date_picker.datePickerMode = .date
        date_picker.accessibilityIdentifier = "iOSDatePicker"
        if #available(iOS 13.4, *) {
            date_picker.preferredDatePickerStyle = .wheels
        }
        date_picker.backgroundColor = .white
        let currentdate = Date()
        date_picker.maximumDate = currentdate
        date_picker.date = currentdate
        picker_baseview.addSubview(picker_title)
        picker_baseview.addSubview(date_picker)
        picker_baseview.addSubview(ok_button)
        picker_baseview.addSubview(cancel_button)
        _view.addSubview(picker_baseview)
    }
}

