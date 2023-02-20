

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
        let p = new Log("sprayed", "sparying succesfull", "farm1", 1, new Date("2022-09-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("scanned", "no issues found", "farm2", 2, new Date("2022-09-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("watered", "wattering succesfull", "farm3", 3, new Date("2023-01-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("alert", "attention needed in south", "farm4", 4, new Date("2022-09-31T00:00:00").getTime())
        nizLogova.push(p)
        
        p = new Log("sprayed", "sparying succesfull", "farm4", 5, new Date("2022-09-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("scanned", "no issues found", "farm1", 6, new Date("2022-09-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("watered", "wattering succesfull", "farm2", 7, new Date("2023-01-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("alert", "attention needed in north", "farm3", 8, new Date("2022-09-31T00:00:00").getTime())
        nizLogova.push(p)

        p = new Log("sprayed", "sparying succesfull", "farm3", 9, new Date("2023-01-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("scanned", "no issues found", "farm4", 10, new Date("2023-01-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("watered", "wattering succesfull", "farm1", 11, new Date("2023-01-31T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("alert", "attention needed in north-east", "farm2", 12, new Date("2023-01-31T00:00:00").getTime())
        nizLogova.push(p)

        p = new Log("sprayed", "sparying succesfull", "farm2", 13, new Date("2023-02-22T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("scanned", "no issues found", "farm3", 14, new Date("2023-02-22T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("watered", "wattering succesfull", "farm4", 15, new Date("2023-02-22T00:00:00").getTime())
        nizLogova.push(p)
        p = new Log("alert", "attention needed in north", "farm1", 1, new Date("2023-02-22T00:00:00").getTime())
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


 
