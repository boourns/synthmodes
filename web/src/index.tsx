import path from 'path';

import { Component } from "preact";
import { ModuleEntry, Manufacturer } from "./render";

export type SynthModesProps = {
    modules: ModuleEntry[]
    manufacturers: Manufacturer[]
}

export class SynthModesIndex extends Component<SynthModesProps, any> {
    render() {
        let list = this.props.manufacturers.map((manu) => {
            let modules = manu.modules.map((module) => {
                const dir = module.id

                return <li><a href={`modules/${dir}/index.html`}>{module.name}</a></li>
            })

            return <>
                <h2>{manu.name}</h2>
                <ol class="synthmodes-moduleList">
                    {modules}
                </ol>
            </>
        })

        return <html>
            <head>
                <title>Synth Modes</title>
                <link rel="stylesheet" href="./static/index.css" />
            </head>
            <body className="synthmodes-body">
                <div className="synthmodes-header">
                    <span class="synthmodes-logo">Synth Modes</span>
                </div>
                <div className="synthmodes-content">
                    <div className="synthmodes-hero">
                        Collection of mobile-friendly synthesizer cheat sheets. 
                    </div>
                    {list}
                </div>
            </body>
        </html>
    }
}