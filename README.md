## Resume (Template) by LaTeX

### About This Project
This project provides a LaTeX template for one-page resume (CV). Users may choose to switch to a fancier style (Font Awesome 5 Pro Desktop Edition is needed).
### Functions Specifications
* `\name{}` - input your name here
* `\phone{}` - input your phone number here
* `\email{}` - input your email here
* `\address{}` - input your address here
* `\resumeStyle{}` - switch the style for resume. Available options are:
    * `normal`: plain (default) style for resume
    * `icons`: use icons in the information part instead of words.
    * `fancy`: a fancier style for resume
* `\module{}` - start of a module in resume (equivalent to `\section` in LaTeX)
* `\institution{}{}` - 2 arguments required. The first should be $\color{#00FFFF}{school / company}$ and the second should be $\color{#00FFFF}{time}$
* `\position{}{}` - 2 arguments required. The first should be $\color{#00FFFF}{major / position}$ and the second should be $\color{#00FFFF}{location}$
* `\minor` - input your minor here (if any)
* `\awards` - 2 arguments required. The first should be the $\color{#00FFFF}{name\ of\  award}$ and the second should be $\color{#00FFFF}{time}$
* `\skills` - 2 arguments required. The first should be the $\color{#00FFFF}{categorary\ of\ skill}$ and the second should be $\color{#00FFFF}{skill\ details}$