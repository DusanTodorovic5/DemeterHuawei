

export class Drone {
    constructor(id?, last_scan?, interval?, scan_time?, farm?) {
        this.id = id
        this.last_scan = last_scan
        this.interval = interval
        this.scan_time = scan_time
        this.farm = farm
    }
    id: Number;
    last_scan: Number;
    interval: Number;
    scan_time: Date;
    farm: String;
   
    createMe()
    {
        let nizDronova = []
        let p = new Drone(1, 12, 100, new Date("2023-02-20T12:00:00").getTime(), "farma1" )
        nizDronova.push(p)
        p = new Drone(2, 22, 200, new Date("2023-02-20T12:00:00").getTime(), "farma2" )
        nizDronova.push(p)
        p =new Drone(3, 212, 300, new Date("2023-02-20T12:00:00").getTime(), "farma3" )
        nizDronova.push(p)
        p = new Drone(4, 2, 10, new Date("2023-02-20T12:00:00").getTime(), "farma4" )
        nizDronova.push(p)
        p = new Drone(5, 28, 30, new Date("2023-02-20T12:00:00").getTime(), "farma1" )
        nizDronova.push(p)
        p = new Drone(6, 44, 50, new Date("2023-02-20T12:00:00").getTime(), "farma2" )
        nizDronova.push(p)
        p =new Drone(7, 32, 40, new Date("2023-02-20T12:00:00").getTime(), "farma3" )
        nizDronova.push(p)
        p = new Drone(8, 1, 30, new Date("2023-02-20T12:00:00").getTime(), "farma4" )
        nizDronova.push(p)
        
        p = new Drone(9, 189, 200, new Date("2023-02-21T12:00:00").getTime(), "farma1" )
        nizDronova.push(p)
        p =new Drone(10, 295, 300, new Date("2023-02-21T12:00:00").getTime(), "farma2" )
        nizDronova.push(p)
        p = new Drone(11, 421, 500, new Date("2023-02-21T12:00:00").getTime(), "farma3" )
        nizDronova.push(p)
        p = new Drone(12, 295, 350, new Date("2023-02-22T12:00:00").getTime(), "farma4" )
        nizDronova.push(p)
        p = new Drone(13, 44, 500, new Date("2023-02-22T12:00:00").getTime(), "farma1" )
        nizDronova.push(p)
        p =new Drone(14, 32, 400, new Date("2023-02-22T12:00:00").getTime(), "farma2" )
        nizDronova.push(p)
        p = new Drone(15, 900, 1000, new Date("2023-02-22T12:00:00").getTime(), "farma3" )


        nizDronova.push(p)
        return nizDronova
    }

    getDrones()
    {
        let ret = this.createMe()
        return ret
    }
}