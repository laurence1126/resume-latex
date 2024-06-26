## Resume (Template) by $\LaTeX$

### About This Project

This project provides a $\LaTeX$ template for one-page (or multi-page, but not optimized) resume (CV). Users may choose to switch to a fancier style ~~(Font Awesome 5 Pro Desktop Edition is needed)~~. Required fonts have already been included in the project.

### Class Options

- `classic`: plain (default) style for resume.
- `icons`: use icons in the personal information section instead of words.
- `fancy`: a fancier style for resume.
- `cmu`: recommended resume style by CMU MSCF Career Services.

### Functions Specifications

- `\name{}`: input your name here.
- `\phone{}`: input your phone number here.
- `\email{}`: input your email here.
- `\linkedin{}`: input the link to your LinkedIn profile page here.
- `\github{}`: input the link to your GitHub profile page here.
- `\address{}`: input your address here.
- `\section{}`: start of a module in resume (equivalent to `\section` in the original $\LaTeX$ syntax).
- `\institution{}[]{}`: 2 required arguments and 1 optional argument. The first required argument should be **_school_** **|** **_company_** and the second required argument should be **_location_**. Fill in the optional argument with the description about this institution.
- `\position{}[]{}`: 2 required arguments and 1 optional argument. The first required argument should be **_major_** **|** **_position_** and the second required argument should be **_time_**. Fill in the optional argument with important information about this institution.
- ~~`\awards{}{}`: 2 arguments required. The first one should be the **_name of award_** and the second one should be **_time_**.~~
- `\skills{}{}`: 2 arguments required. The first one should be the **_category of skill_** and the second one should be **_skill details_**.
- `\note{}`: 1 argument required. Any additional information or comments should be placed here. Add a `*` mark to use the italic font.
