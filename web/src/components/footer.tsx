import { Component, Fragment } from "preact";
import { appStore } from "./icons";

export type FooterProps = {
    pageTitle?: string
}

export class Footer extends Component<FooterProps, any> {
    render() {
        return <div>
        <a href="https://shop.burns.ca/products/modular-drums-001-bia-techno">
        <div class="samplepack">
        <div class="samplepack-content">
            <div class="samplepack-image">
                <img src="https://cdn.shopify.com/s/files/1/0169/5584/products/image_150x.jpg?v=1574437087" />
            </div>
            <div class="samplepack-text">
                <b>500+ Samples of the Noise Engineering Basimilus Iteritas Alter for $5</b>
                <p>Support SynthModes by buying our new sample pack.  Free demo pack available!</p>
            </div>
        </div>
        </div>
        </a>

        <div className="synthmodes-footer">
            <div className="synthmodes-footer-col">
                <a href="https://itunes.apple.com/ca/app/modes/id1445358435?mt=8">
                    {appStore()}
                    <div>Get SynthModes for iOS</div>
                </a>
            </div>

            <div className="synthmodes-footer-col">
                <div>By <b>tom@burns.ca</b></div>
                <a href="https://github.com/boourns">Github</a>
                <a href="https://instagram.com/gravitronic">Instagram</a>
                <a href="https://twitter.com/burnsAudio">Twitter</a>
            </div>

            <div className="synthmodes-footer-col">
                <a href="https://sequencer.party">Sequencer Party: a multiplayer audio, midi, and video web platform</a>
            </div>
        </div>

        </div>
    }
}

