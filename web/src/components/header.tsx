import { Component } from "preact";
import { github } from "./icons";

export type HeaderProps = {
    pageTitle?: string
}

export class Header extends Component<HeaderProps, any> {
    render() {
        let pageTitle
        if (this.props.pageTitle) {
            pageTitle = <span style="padding-left: 8px;"><a href="#" class="synthmodes-sublogo">● {this.props.pageTitle}</a></span>
        }

        return <div className="synthmodes-header">
                    <div className="synthmodes-header-left">
                        <a href="/" class="synthmodes-logo">Synth Modes</a>{pageTitle}
                    </div>
                    <div className="synthmodes-header-right">
                        {github()}
                    </div>
                </div>
    }


}