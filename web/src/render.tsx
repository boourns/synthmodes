import path from "path"
import { render } from 'preact-render-to-string';
import {load} from 'cheerio';

import xml2js from 'xml2js';

import { readFileSync, existsSync, mkdirSync, writeFileSync, readdirSync } from 'fs'
import {exec} from 'child_process'

import { SynthModesIndex } from '.';
import { PageView } from './page';

export type PageEntry = {
    name: string
    filename: string
    content: string
    tags: string[]
    icon: string
}

export type SectionEntry = {
    name: string
    modelist: boolean
    pages: PageEntry[]
}

export class ModuleEntry {
    name: string
    manufacturer: string
    id: string
    index: string
    css: string
    sections: SectionEntry[] = []

    constructor(manufacturer: string, obj: any) {
        this.name = obj.$.name
        this.id = obj.$.id
        this.index = obj.$.index
        this.manufacturer = manufacturer
        this.css = ""
    }
}

export class Manufacturer {
    name: string
    modules: ModuleEntry[] = []

    constructor(obj: any) {
        this.name = obj.$.name

        for (const module of obj.module) {
            const m = new ModuleEntry(this.name, module)
            this.modules.push(m)
        }
    }
}

var manufacturers: Manufacturer[] = []
var modules: ModuleEntry[] = []

const loadData = async () => {
    const doc = await xml2js.parseStringPromise(readFileSync("../data/modules.xml", "utf8"))

    for (const manufacturer of doc.modules.manufacturer) {
        const m = new Manufacturer(manufacturer)
        manufacturers.push(m)
        modules = modules.concat(m.modules)
    }

    for (let module of modules) {
        module.sections = await loadModule(module)
    }
}

const loadPage = (index: string, name: string) => {
    const dir = path.dirname(index);
    
    const html = readFileSync(`../data/${dir}/${name}`, 'utf-8')

    const $ = load(html);

    // Get the HTML of a specific element
    const elementHtml = $('body').html();

    return elementHtml
}

const loadModule = async (entry: ModuleEntry) => {
    const module = await xml2js.parseStringPromise(readFileSync(`../data/${entry.index}`, "utf8"))
    const dir = `../data/${path.dirname(entry.index)}`;

    let sections: SectionEntry[] = []

    for (const sect of module.module.sections[0].section) {

        const s: SectionEntry = {
            name: sect.$.name,
            modelist: sect.$.modelist === "true",
            pages: sect.page.map((p: any) => {
                return {
                    name: p.$.name, content: loadPage(entry.index, p.$.content), tags: (p.$.tags ? p.$.tags[0].tags : []), icon: p.$.icon
                }
            }),
        }
        
        sections.push(s)
    }

    // load base and custom css
    const cssFiles = ['../data/common.css', ...(readdirSync(dir).filter(f => f.endsWith(".css")).map(c => `${dir}/${c}`))]

    entry.css = cssFiles.map(f => readFileSync(f)).join("\n")

    return sections
}

const renderModule = async (entry: ModuleEntry) => {
    const module = render(<PageView module={entry} />)
    const dir = entry.id

    const outdir = path.join("../docs/modules", dir)
    console.log("Making ", outdir)
    if (!existsSync(outdir)) {
        mkdirSync(outdir, { recursive: true })
    }

    if (existsSync(path.join("../data", dir, "img"))) {
        exec(`cp -r ../data/${dir}/img ${outdir}/img`)
    }

    writeFileSync(path.join(outdir, "index.html"), `
    <!DOCTYPE html>
    ${module}
    `)
}

const renderIndex = async () => { 
    const index = render(<SynthModesIndex modules={modules} manufacturers={manufacturers} />)
    writeFileSync("../docs/index.html", `
    <!DOCTYPE html>
    ${index}
    `)
}

const renderSite = async () => {
    await loadData()
    await renderIndex()

    for (const module of modules) {
        await renderModule(module)
    }
}

renderSite()
