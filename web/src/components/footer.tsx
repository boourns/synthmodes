import { Component } from "preact";

export type FooterProps = {
    pageTitle?: string
}

export class Footer extends Component<FooterProps, any> {
    render() {
        return <div className="synthmodes-footer">
            <div style="background-color:red;" className="synthmodes-footer-col">
                
            </div>
            <div className="synthmodes-footer-col">
                By <b>tom@burns.ca</b>
            </div>
            <div className="synthmodes-footer-col">
                <a href="https://github.com/boourns">Github</a>
                <a href="https://instagram.com/gravitronic">Instagram</a>
                <a href="https://twitter.com/burnsAudio">Twitter</a>
                <a href="https://sequencer.party">Sequencer Party</a>
            </div>
        </div>
    }
}