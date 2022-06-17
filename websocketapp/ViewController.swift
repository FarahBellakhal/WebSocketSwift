//
//  ViewController.swift
//  websocketapp
//
//  Created by mac on 28/04/2022.
//

import UIKit
import Starscream
import SocketIO
class ViewController: UIViewController {
    
    
    @IBOutlet weak var sendeddata: UITextField!
    var isConnected: Bool = false

  /*  func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            print("PieSocket is connected: \(headers)")
        case .disconnected(let reason, let code):
            isConnected = false
            print("PieSocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(_):
            isConnected = false
            //handleError(error)
        case .binary(_):
            break
        }
    }
    

    var socket = WebSocket(request: URLRequest(url: URL(string: "http://localhoast.com:13400")!))
     
   func websocketDidConnect(socket: WebSocketClient) {
       print("websocketDidConnect")
   }
   
   func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
       print("websocketDidDisconnect", error ?? "")
   }
   
   func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
       print("websocketDidReceiveMessage", text)
   }
   
   func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
       print("websocketDidReceiveData", data)
   }*/
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
     //  socket.delegate = self
   }
   
   @IBAction func connect(_ sender: Any) {
       startTest()
       //socket.connect()
   }
    func startTest(){

            let manager = SocketManager(socketURL: URL(string: "http://localhost:8080")!, config: [.log(true), .compress])

            let socket = manager.defaultSocket

     

            socket.on(clientEvent: .connect) {data, ack in

                print("socket connected")

            }

     

            socket.on("currentAmount") {data, ack in

                guard let cur = data[0] as? Double else { return }

                

                socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in

                   /* if data.first as? String ?? "passed" == SocketAckValue.noAck {

                        // Handle ack timeout

                    }*/

     

                    socket.emit("update", ["amount": cur + 2.50])

                }

     

                ack.with("Got your currentAmount", "dude")

            }

     

            socket.connect()

        }

        
    @IBAction func sendActionbtn(_ sender: Any) {
      //  socket.write(string: sendeddata.text!)
    }
    
/*class ViewController: UIViewController {
    
   // let  msocket = WebSocketClient?
    var isConnected: Bool = false
    
    var connectButton: UIButton?
    var sendButton: UIButton?
    var closeButton: UIButton?
    //var apiKey = "oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm"; //Demo key, get yours at piesocket.com
   // var channelId = "1";

    //var request = URLRequest(url: URL(string: "wss://demo.piesocket.com/v3/channel_1+?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm&notifySelf")!)
      // request.timeoutInterval = 5
   var socket = WebSocket(request: URLRequest(url: URL(string: "wss://demo.piesocket.com/v3/channel_1?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self")!))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //socket.delegate()
        initViews()
        //socket.delegate
        
        
    }
    private func initViews() {
        connectButton = UIButton(type: .system)
        connectButton?.setTitle("connect", for: .normal)
        connectButton?.frame = CGRect(x: 150, y: 200, width: 100, height: 36)
        self.view.addSubview(connectButton!)
        
        sendButton = UIButton(type: .system)
        sendButton?.setTitle("sendMessage", for: .normal)
        sendButton?.frame = CGRect(x: 150, y: 300, width: 100, height: 36)
        self.view.addSubview(sendButton!)
        
        closeButton = UIButton(type: .system)
        closeButton?.setTitle("close", for: .normal)
        closeButton?.frame = CGRect(x: 150, y: 400, width: 100, height: 36)
        self.view.addSubview(closeButton!)
        
        connectButton?.addTarget(self, action: #selector(connetButtonClicked), for: .touchUpInside)
        sendButton?.addTarget(self, action: #selector(sendButtonClicked), for: .touchUpInside)
        closeButton?.addTarget(self, action: #selector(closeButtonCliked), for: .touchUpInside)
    }
    

    



    
   
    
    // Mark - Actions
    // 连接
    @objc func connetButtonClicked() {
        // msocket()?.connect()
        socket.connect()
    }
    // 通信
    @objc func sendButtonClicked() {
         //write some Data over the socket!
        //socket.send("Coucou le serveur !");
        socket.write(string: "coucou le serveur")
    }
    // 断开
    @objc func closeButtonCliked() {
        //msocket()?.disconnect()
        socket.disconnect()
    }
}

extension ViewController: WebSocketDelegate {
    // 处理服务端回调
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            print("PieSocket is connected: \(headers)")
        case .disconnected(let reason, let code):
            isConnected = false
            print("PieSocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(_):
            isConnected = false
            //handleError(error)
        case .binary(_):
            break
        }
    }
}*/
}
