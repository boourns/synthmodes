# synthmodes
Mobile-friendly cheat sheets for synthesizer modules

This repo powers https://www.synthmodes.com, and the [Modes app for iOS](https://itunes.apple.com/ca/app/modes/id1445358435?mt=8).

# contributing
The cheat sheets are written in HTML with some CSS for styling.  If you want to contribute in that format, that is great.  If you don't have the skills, formatted text or markdown in an issue is a great start.

## Adding a module
Module documentation consists of an index XML file listing the pages with their icons and tags, and separate HTML files, one for each page of a cheat sheet.

To add a module:
- Create a subdirectory for your module under the data/ directory
- Create a "module.xml" file for your module.  This describes what pages exist in the module's documentation.  For example see Rings' [module.xml](https://github.com/boourns/synthmodes/blob/master/data/rings/module.xml).  You can leave out the `icon` key if you don't have icons for your pages.
- Add an entry for your module into [data/modules.xml](https://github.com/boourns/synthmodes/blob/master/data/modules.xml).
- For each page in your module.xml, create a standalone HTML file.  It's probably easiest to start by copying whatever existing page looks closest to your desired result.

Generally speaking, stick to no inline styles, no javascript.  Use the existing styles for LEDs and knobs, add a second CSS file in your module directory for any new styles.

Please note, all contributions must be original work free from other copyright.  Please do not copy & paste content unless you have explicit license or permission from the copyright holder.

## Testing the XML and building the doc pages
Requirements: a recent version Ruby and bundler

Run `bundle install` to set up dependencies. Run `./test.sh` to run some basic sanity checks of the XML, as well as run the website builder (which will detect if any documentation files are missing). If your system isn't well set up for this, you can also push your code to github and open a PR.  Travis-CI will run the tests for you and report on the branch if it passes or fails.

## Testing the documentation pages

Unfortunately the app is set up right now to load third party module files, however since the styles are so simple, the best way to test is to just set up a narrow browser tab as your testing environment.  Safari would be the closest browser engine if possible, but generally speaking if the HTML/CSS is simple it should be cross-platform.

The best test for how it will look in-app is to just open each page in your browser directly with the `file://` url pointing to the page on your hard drive.

You can run the website locally after running `./test.sh` by navigating to the /web directory and running `bundle` to set up dependencies and then `bundle exec jekyll serve` this starts a server on http://127.0.0.1:4000/

Feel free to open PRs early to get feedback or help if you get stuck, or open issues if these instructions are unclear.

# code of conduct
see CODE_OF_CONDUCT.md

# license
This repository is provided under the [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) license.  You are free to share and adapt the contents as long as you provide attribution

# permission
While explicit permission for writing documentation for someone else's module is not really necessary, the following firmware and module developers have been contacted and have responded positively to the content of this application and documentation project.

- Andrew Ostler (Expert Sleepers)
- Émilie Gillet (Mutable Instruments)
- Matthias Puech (Parasites)
