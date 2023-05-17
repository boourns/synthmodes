import { Component } from "preact";

export type FooterProps = {
    pageTitle?: string
}

export class Footer extends Component<FooterProps, any> {
    render() {
        return <div style="background-color: black;" className="synthmodes-footer">
            <div style="background-color:red;" className="synthmodes-footer-col">Col 1</div>
            <div style="background-color:green;" className="synthmodes-footer-col">Col 2</div>
            <div style="background-color:blue;" className="synthmodes-footer-col">Col 3</div>
        </div>
    }
}