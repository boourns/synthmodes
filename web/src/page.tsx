import path from 'path';
import xml2js from 'xml2js';
import { readFileSync } from 'fs'

import { Component } from "preact";
import { ModuleEntry } from "./render";

export type PageProps = {
    module: ModuleEntry
}

export class PageView extends Component<PageProps, any> {
    render() {
        const module = this.props.module

        const body = module.sections.map(s => s.pages.map(p => p.content)).flat()

        console.log(module.sections[0].pages[0].content)
        
        return <html>
            <head>
                <title>Synth Modes</title>
                <link rel="stylesheet" href="./static/index.css" />
            </head>
            <body>
                {body}
            </body>
        </html>
    }
}