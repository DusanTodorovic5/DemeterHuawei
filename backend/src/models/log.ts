

export class Log {

 
    constructor(action?, text?, farm?, droneId?, time?) {
        this.action = action
        this.text = text
        this.farm = farm
        this.droneId = droneId
        this.time = time
    }
    action: LogAction;
    text: String;
    farm: String;
    droneId: Number;
    time: Number;


    createMe()
    {
        let nizLogova = []
        let p = new Log("sprayed", "text", "farma", 1, new Date("2010-09-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("scanned", "text", "plantaza", 1, new Date("2011-09-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("watered", "text", "farma", 12, new Date("2012-09-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("alert", "text", "plantaza", 12, new Date("2007-09-31T00:00:00").getTime())
        nizLogova.push(p)
        return nizLogova
    }
   
    nizSortiranih()
    {
        let nizLogova = this.createMe()
        
        nizLogova.sort((d1,d2)=>{
            return d2.time-d1.time
        })
        return nizLogova
    }

}


export enum LogAction {
    sprayed = "sprayed",
    scanned = "scanned",
    watered = "watered",
    alert = "alert",
  }


 
