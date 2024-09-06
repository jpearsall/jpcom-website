<!-- Template kindly borrowed from https://github.com/othneildrew/Best-README-Template -->
<a id="readme-top"></a>


<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![GPL-3.0 License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#configuration">Configuration</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/jpearsall/jpcom-website">
    <img src="images/logo.png" alt="Logo" width="398" height="313">
  </a>

<h3 align="center">jpcom-website</h3>

  <p align="center">
    Terraform and Hugo configuration for the <a href="https://johnpearsall.com">johnpearsall.com</a> website.
    <br />
    <br />
    <a href="https://github.com/jpearsall/jpcom-website/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/jpearsall/jpcom-website/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>


<!-- ABOUT THE PROJECT -->
<a id="about-the-project"></a>
## About The Project

This repository is for the Terraform configuration of the [johnpearsall.com](https://johnpearsall.com) website.

Project scope:
* Core elements such as the domain, TLS certificates, and DNS are delegated to the [jpcom-infrastructure](https://github.com/jpearsall/jpcom-infrastructure) repo.
* The website hosting element as well as the website contents are contained in this repo.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [![Terraform][Terraform]][Terraform-url]
* [![tfenv][Tfenv]][Tfenv-url]
* [![Hugo][Hugo]][Hugo-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

Hugo is required to build the static website. We are managing Terraform via tfenv which manages Terraform environments similarly to rbenv.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Prerequisites

Follow the linked installation instructions under each tool.

* Hugo
  * Follow the Hugo [installation](https://gohugo.io/installation/) guide for your OS.
* tfenv
  * Follow the [installation](https://github.com/tfutils/tfenv?tab=readme-ov-file#installation) directions from the project's README.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Configuration

- Follow Hugo's documentation to [Configure Hugo](https://gohugo.io/getting-started/configuration/)
   - Many of the fields are fairly self-explanatory. Here is a description of some of the more cryptic options.
      - `enableThemeToggle`: Setting this to true will enable a toggle for light/dark/system mode if your theme supports it.
      - `[taxonomies]`: Taxonomies are ways of grouping your content. I would refer to the [documentation](https://gohugo.io/content-management/taxonomies/). 
- The `tfenv` tool will manage Terraform versions for you.
   - Just make sure your `tf/.terraform-version` matches the `tf/required_version` defined in `tf/providers.tf`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->
## Usage

⚠️ This section is under construction until I can resolve a few issues.
* [ ] Create [jpcom-infrastructure](https://github.com/jpearsall/jpcom-infrastructure) repository and pull resources from the module outputs.
* [ ] Convert some of the hardcoded values such as domain names, etc. to Terraform variables.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Create tests for Hugo
- [ ] Create tests for Terraform
- [ ] Research multiple image display options.
    - [ ] Implement image display options.

See the [open issues](https://github.com/jpearsall/jpcom-website/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Top contributors:

<a href="https://github.com/jpearsall/jpcom-website/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=jpearsall/jpcom-website" alt="contrib.rocks image" />
</a>



<!-- LICENSE -->
## License

Distributed under the GPL-3.0 License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

John Pearsall - [@notoriousjwp](https://twitter.com/notoriousjwp) - [jwp@johnpearsall.com](mailto:jwp@johnpearsall.com)

Project Link: [https://github.com/jpearsall/jpcom-website](https://github.com/jpearsall/jpcom-website)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* Inspired by [jscom-blog](https://github.com/johnsosoka/jscom-blog) by [@johnsosoka](https://github.com/johnsosoka)
* Badges provided by [Shields.io](https://shields.io) (We **do** need no stinkin' badges!)
* The lovely [hello-friend-ng](https://themes.gohugo.io/themes/hugo-theme-hello-friend-ng/) theme for Hugo.
* Shoutout to [@draik](https://github.com/draik) for testing!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/jpearsall/jpcom-website.svg?style=for-the-badge
[contributors-url]: https://github.com/jpearsall/jpcom-website/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jpearsall/jpcom-website.svg?style=for-the-badge
[forks-url]: https://github.com/jpearsall/jpcom-website/network/members
[stars-shield]: https://img.shields.io/github/stars/jpearsall/jpcom-website.svg?style=for-the-badge
[stars-url]: https://github.com/jpearsall/jpcom-website/stargazers
[issues-shield]: https://img.shields.io/github/issues/jpearsall/jpcom-website.svg?style=for-the-badge
[issues-url]: https://github.com/jpearsall/jpcom-website/issues
[license-shield]: https://img.shields.io/github/license/jpearsall/jpcom-website.svg?style=for-the-badge
[license-url]: https://github.com/jpearsall/jpcom-website/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/jwpearsall

[Terraform]: https://img.shields.io/badge/terraform-7b42bc?style=for-the-badge&logo=terraform&logoColor=white
[Terraform-url]: https://terraform.io/
[Tfenv]: https://img.shields.io/badge/tfenv-000000?style=for-the-badge&logo=github&logoColor=white
[Tfenv-url]: https://github.com/tfutils/tfenv
[Hugo]: https://img.shields.io/badge/hugo-00875d?style=for-the-badge&logo=hugo&logoColor=white
[Hugo-url]: https://gohugo.io/
