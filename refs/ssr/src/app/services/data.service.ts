import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import * as signalR from '@microsoft/signalr';
import { Observable, Subject } from 'rxjs';
import { MessageDto } from '../Dto/MessageDto';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  private  connection: any = new signalR.HubConnectionBuilder().withUrl("https://localhost:44341/datasocket")   
             .configureLogging(signalR.LogLevel.Information)
            .build();
  
      readonly POST_URL = "https://localhost:44341/api/data/send"
                                        
      private receivedMessageObject: MessageDto = new MessageDto();
      private sharedObj = new Subject<MessageDto>();

      
  constructor(private http: HttpClient) {

      this.connection.onclose(async () => {
              await this.start();
            });
          this.connection.on("ReceiveOne", (user:any, message:any) => { this.mapReceivedMessage(user, message); });
          this.start();  

   }


   
   public async start() {
    try {
      await this.connection.start();
      console.log("connected");
    } catch (err) {
      console.log(err);
      setTimeout(() => this.start(), 5000);
    } 
  }

  
  private mapReceivedMessage(user: string, message: string): void {
    this.receivedMessageObject.user = user;
    this.receivedMessageObject.msgText = message;
    this.sharedObj.next(this.receivedMessageObject);
 }

  /* ****************************** Public Mehods **************************************** */

  // Calls the controller method
  // public broadcastMessage(msgDto: any) {
  //   this.http.post(this.POST_URL, msgDto).subscribe(data => console.log(data));
  //   // this.connection.invoke("SendMessage1", msgDto.user, msgDto.msgText).catch(err => console.error(err));    // This can invoke the server method named as "SendMethod1" directly.
  // }

  public retrieveMappedObject(): Observable<MessageDto> {
    return this.sharedObj.asObservable();
  }
}
