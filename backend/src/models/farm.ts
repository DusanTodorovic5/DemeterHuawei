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

        let p = new Farm("farma1", new Date("2010-09-31T00:00:00").getTime(), {})
        p.layout = new FarmLayout(new Date("2010-09-31T00:00:00").getTime(), { "key1": "val1" , "key2": "val2"})

        p = new Farm("farma2", new Date("2011-09-31T00:00:00").getTime(), {})
        p.layout = new FarmLayout(new Date("2010-09-31T00:00:00").getTime(), { "key3": "val1" , "key2": "val2"} )
        nizFarmi.push(p)

        p = new Farm("farma3", new Date("2012-09-31T00:00:00").getTime(), {})
        p.layout = new FarmLayout(new Date("2010-09-31T00:00:00").getTime(), { "key3": "val1" , "key2": "val2"} )
        nizFarmi.push(p)

        p = new Farm("farma4", new Date("2013-09-31T00:00:00").getTime(), {})
        p.layout = new FarmLayout(new Date("2010-09-31T00:00:00").getTime(), { "key6": "val1" , "key2": "val2"} )
        nizFarmi.push(p)

        return nizFarmi
    }

    getFarms()
    {
        let ret = this.createMe()
        return ret
    }
}

