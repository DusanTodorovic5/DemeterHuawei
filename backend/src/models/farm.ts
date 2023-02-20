import { FarmLayout } from "./layout_farm";


export class Farm {
    constructor(name?, lastScanned?, layout?) {
        this.name = name
        this.lastScanned = lastScanned
        this.layout = layout
    }
    name:String;
    lastScanned:Number;
    layout:FarmLayout;



    createMe()
    {
        let nizFarmi = []

        let p = new Farm("farma1", new Date("2023-02-22T00:00:00").getTime(), {})
        p.layout = new FarmLayout(new Date("2023-01-31T00:00:00").getTime(), { "west": "wheat" , "east": "wheat"})
        nizFarmi.push(p)

        p = new Farm("farma2", new Date("2023-02-22T00:00:00").getTime(), {})
        p.layout = new FarmLayout(new Date("2023-01-31T00:00:00").getTime(), { "sout-west": "wheat" , "south-east": "wheat", "north-west":"what", "north-east": "whear"})
        nizFarmi.push(p)

        p = new Farm("farma3", new Date("2023-02-22T00:00:00").getTime(), {})
        p.layout = new FarmLayout(new Date("2023-01-31T00:00:00").getTime(), { "north": "corn" , "south": "corn"} )
        nizFarmi.push(p)

        p = new Farm("farma4", new Date("2023-02-22T00:00:00").getTime(), {})
        p.layout = new FarmLayout(new Date("2023-02-22T00:00:00").getTime(), { "north": "corn" , "south": "wheat"} )
        nizFarmi.push(p)

        return nizFarmi
    }

    getFarms()
    {
        let ret = this.createMe()
        return ret
    }
}

