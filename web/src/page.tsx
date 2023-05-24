import { Component } from "preact";
import { ModuleEntry } from "./render";
import { Header } from './components/header';
import { Footer } from './components/footer';

export type PageProps = {
    module: ModuleEntry
}

export class PageView extends Component<PageProps, any> {
    render() {
        const module = this.props.module

        const body = module.sections.map(s => {
            const pageContent = s.pages.map(p => {
                const icon = p.icon ? <img class="pageIcon" src={p.icon}></img> : undefined

                return <div class="page">
                    <div class="pageTitleBlock"><a href={`#p-${p.name}`}><h3 class="pageTitle" id={`p-${p.name}`}>{icon} {p.name}</h3></a></div>
                    <div dangerouslySetInnerHTML={{__html: p.content}}></div>
                </div>
            })
            return <div>
            <h2 id={`s-${s.name}`}>{s.name}</h2>
            <div>
                {pageContent}
            </div>
            </div>
        })

        return <html>
            <head>
                <title>{module.name} | Synth Modes</title>
                <meta charSet="utf-8"></meta>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <meta name="description" content={`Synthesizer cheat sheet for the ${module.manufacturer} ${module.name}`}></meta>
                <link rel="stylesheet" href="../../static/index.css" />
                <link rel="stylesheet" href="../../static/module.css" />
                <style>
                    {module.css}
                </style>
            </head>
            <body class="page-body">
                <Header pageTitle={module.name}/>

                <div class="contentWrapper">
                    <div class="sidebar">
                        <ul>
                            {module.sections.map(s => {
                                return <div class="sidebarSection">
                                    <li><b><a href={`s-${s.name}`}>{s.name}</a></b></li>
                                    <ul>
                                        {s.pages.map(p => {
                                            const icon = p.icon ? <img class="pageIcon" src={p.icon}></img> : undefined

                                            return <li><a href={`#p-${p.name}`}>{icon}{p.name}</a></li>
                                        })}
                                    </ul>                                
                                </div>
                            })}
                        </ul>
                    </div>

                    <div class="mainWrapper">
                        <div class="main">
                            {body}
                        </div>
                        <Footer></Footer>
                    </div>
                </div>
            </body>
        </html>
    }
}