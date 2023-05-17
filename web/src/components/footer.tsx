import { Component } from "preact";
import { appStore, githubMini, instagram } from "./icons";

export type FooterProps = {
    pageTitle?: string
}

export class Footer extends Component<FooterProps, any> {
    render() {
        return <div className="synthmodes-footer">
            <div className="synthmodes-footer-col">
                {appStore()}
                <div>Get SynthModes for iOS</div>
            </div>

            <div className="synthmodes-footer-col">
                <div>By <b>tom@burns.ca</b></div>
                <a href="https://github.com/boourns">{githubMini()}</a>
                <a href="https://instagram.com/gravitronic">{instagram()}</a>
                <a href="https://twitter.com/burnsAudio">Twitter</a>
            </div>

            <div className="synthmodes-footer-col">
                <a href="https://sequencer.party">Sequencer Party</a>
            </div>
        </div>
    }
}

