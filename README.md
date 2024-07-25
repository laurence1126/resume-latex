## Resume (Template) by $\LaTeX$

### About This Project

This project provides a $\LaTeX$ template for one-page (or multi-page, but not optimized) resume (CV). Users may choose to switch to a fancier style ~~(Font Awesome 5 Pro Desktop Edition is needed)~~. Required fonts have already been included in the project.

### Class Options

| **Options**  | **Description**                                                |
| ------------ | -------------------------------------------------------------- |
| `classic`    | plain (default) style for resume                               |
| `icons`      | use icons in the personal information section instead of words |
| `fancy`      | a fancier style for resume                                     |
| `cmu`        | recommended resume style by CMU MSCF Career Services           |
| `hideGithub` | hide GitHub icon and link behind project name                  |

### Functions Specifications

| **Function Name**      | **Required Argument** | **Optional Argument** | **Description**                                                                                                                                                                                                                                                                                |
| ---------------------- | --------------------- | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `\name{}`              | 1                     | 0                     | input your name here                                                                                                                                                                                                                                                                           |
| `\phone{}`             | 1                     | 0                     | input your phone number here                                                                                                                                                                                                                                                                   |
| `\email{}`             | 1                     | 0                     | input your email here                                                                                                                                                                                                                                                                          |
| `\linkedin{}`          | 1                     | 0                     | input the link to your LinkedIn profile page here                                                                                                                                                                                                                                              |
| `\github{}`            | 1                     | 0                     | input the link to your GitHub profile page here (optional)                                                                                                                                                                                                                                     |
| `\address{}`           | 1                     | 0                     | input your address here (optional)                                                                                                                                                                                                                                                             |
| `\section{}`           | 1                     | 0                     | start of a module in resume (equivalent to `\section` in the original $\LaTeX$ syntax)                                                                                                                                                                                                         |
| `\institution{}[][]{}` | 2                     | 2                     | the first required argument should be **_school_** or **_company_** and the second required argument should be **_location_**. Fill in the first optional argument with the description about this institution and the second optional argument with any additional info (without parentheses) |
| `\position{}[]{}`      | 2                     | 1                     | the first required argument should be **_major_** or **_position_** and the second required argument should be **_time_**. Fill in the optional argument with important information about this role                                                                                            |
| `\skills{}{}`          | 2                     | 0                     | the first one should be the **_category of skill_** and the second one should be **_skill details_**                                                                                                                                                                                           |
| `\note{}`              | 1                     | 0                     | any additional information or comments should be placed here. Add a `*` mark to use the italic font                                                                                                                                                                                            |
| `\githubLink{}`        | 1                     | 0                     | input the GitHub webpage link associated with the project. A GitHub icon that contains the hyperlink will be displayed (not in `hideGithub` mode)                                                                                                                                              |
