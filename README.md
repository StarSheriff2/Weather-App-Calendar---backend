<div align="center">
<h1>Weather App Calendar API</h1>
</div>

<div align="center">
    <img src="https://img.shields.io/badge/Ruby_on_Rails-darkred?logo=rubyonrails">
     <img src="https://img.shields.io/badge/-PostGreSQL%2015.1-4169E1?logo=postgresql&logoColor=white">
    <img src="https://img.shields.io/badge/Rspec-yellow">
    <img src="https://img.shields.io/badge/-Docker-2496ED?logo=docker&logoColor=white">
    <img src="https://img.shields.io/badge/-Swagger-85EA2D?logo=swagger&logoColor=black">
    <img src="https://img.shields.io/badge/Factory_Bot-red">
    <img src="https://img.shields.io/badge/Render-46E3B7?logo=Render&logoColor=white">
    <img src="https://img.shields.io/badge/JWT-000000?logo=Json%20Web%20Tokens">
    <img src="https://img.shields.io/badge/-Rubocop-000000?logo=Rubocop">
</div>

<br>

<p align="center">This RESTFUL API works as the backend for a React web app. I host the API on <i>Render.com</i> through a <i><strong>dockerized</strong> Ruby on Rails</i> app. Authentication is handled with a <strong>JWT Token</strong> stored in the localStorage of the frontend.</p>

<br>

<div align="center"><img width="80%" alt="app screenshot mobile" src="./.github/images/reminders_page_screenshot_desktop.png">
<img width="30%" alt="app screenshot mobile" src="./.github/images/new_reminder_screenshot_mobile.png">
<img width="30%" alt="app screenshot mobile" src="./.github/images/highlighted_reminder_screenshot_mobile.png">
<img width="30%" alt="app screenshot mobile" src="./.github/images/reminders_page_menu_screenshot_mobile.png">
</div>

<br>

<!-- omit from toc -->
## Table of Contents
- [About](#about)
  - [File Structure](#file-structure)
  - [Features](#features)
  - [Front-end React app](#front-end-react-app)
  - [Live Demo](#live-demo)
  - [Built With](#built-with)
- [Setup and installation](#setup-and-installation)
    - [Get files](#get-files)
  - [Docker Deploy](#docker-deploy)
    - [Prerequisites](#prerequisites)
    - [Run](#run)
  - [Local deploy](#local-deploy)
    - [Prerequisites](#prerequisites-1)
    - [Install Dependencies](#install-dependencies)
    - [Database Setup](#database-setup)
- [Usage](#usage)
- [Development](#development)
  - [Testing](#testing)
    - [Coverage report](#coverage-report)
  - [Linters](#linters)
- [Authors](#authors)
- [🤝 Contributing](#-contributing)
- [🤝 Acknowledgements](#-acknowledgements)
- [Show your support](#show-your-support)
- [📝 License](#-license)


## About
Weather App Calendar API is the API handling the core requests of the Weather Calendar App. The frontend is a ***fully responsive*** react web app deployed [here](https://weather-app-calendar.netlify.app/). The [repo for the front-end is here](https://github.com/StarSheriff2/Weather-App-Calendar---frontend). I built request tests for all endpoints, achieving a 97% test coverage. I also created tests for all models. I use JWT token to handle user authentication and authorization.

### File Structure
<div align="left"><img width="30%" alt="app screenshot mobile" src="./.github/images/file_structure_snap1.png">
</div>
<div align="left"><img width="30%" alt="app screenshot mobile" src="./.github/images/file_structure_snap2.png">
</div>

### Features
- authenticate user
- create new user
- create new session
- all CRUD operations for the Reminder resource

### Front-end React app
- The front-end associated with this app is [here](https://weather-app-calendar.netlify.app).

- The Github repo of the front-end is [here](https://github.com/StarSheriff2/Weather-App-Calendar---frontend).

### Live Demo

![Render](https://img.shields.io/badge/render-passing-brightgreen.svg?style=flat)

Deployed to [Render.com](https://weatherapp-api.onrender.com)

### Built With
- Ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [arm64-darwin20]
- Rails 6.1.4.4
- PostgreSQL 14
- Rspec (testing)
- Faker gem
- Factory bot
- JWT
- Docker 20.10.22
- Docker compose v2.15.1

## Setup and installation

To get a local copy up and running, follow these simple example steps.

#### Get files
1. Open your terminal or command prompt.
2. If you do not have git installed in your system, skip this step and go to step 3; otherwise, go to the directory where you want to copy the project files and clone it by copying this text into your command prompt/terminal:
```
  https://github.com/StarSheriff2/Weather-App-Calendar---backend.git
```
  <br>

  *Now go to either the ***"Docker Deploy"*** or the ***"Local Deployt"*** section, depending on how you wish to deploy the API in your system.*

  <br>

3. Download the program files by clicking on the green button that says “**Code**” on the upper right side of the project frame.
4. You will see a dropdown menu. Click on “**Download ZIP**.”
5. Go to the directory where you downloaded the **ZIP file** and open it. Extract its contents to any directory you want in your system.

### Docker Deploy

#### Prerequisites

- Docker 20.10.22 or latest
- Docker Compose v2.15.1

#### Run

```bash
  docker compose up -d
```

### Local deploy
#### Prerequisites

- Ruby 3.0.2p107
- Rails 6.1.4.4
- PostgreSQL 14

#### Install Dependencies
1. If you are not in your system terminal/command prompt already, please open it and go to the directory where you cloned the remote repository or extracted the project files.
2. While in the project root directory, type
    ```
    bundle install
    ```
This command will install all the necessary gems in your system.

#### Database Setup

- Create an .env file copy and paste this into it:
  ```bash
  DATABASE_HOSTNAME=postgres
  ```

- Run
  ```bash
  bin/rails db:setup
  ```
  This will create your local databases, load the schema, and initialize with the seed data.

  **Note:** If you get an error after running this command, it might be because you don't have a database called ***"postgres"***. This happens because when you create a new Rails application, Rails uses this "postgres" database to create and manage the databases for your application. You can easily create one by running this command:
  ```bash
  createdb postgres
  ```

  If Rails still complains about not finding the "postgres" role, you can create one with super-user priviledges:
  ```bash
  createuser -s postgres
  ```

  Now try running the db:setup command again!

You are all set now!

## Usage
1. In your terminal, run

    ```bash
    bin/rails server
    ```
    while inside the root directory of the repository files

    **Note:** _This command will not stop on its own. To exit, hit "ctrl + c"_

2. The app allows API calls using curl or your favorite API client, such as Postman, HTTPPie or VS Code's Thunder Client. Here's a link to [HTTPIE](https://httpie.io).
3. Check status of the api by calling this endpoint ***/healthcheck***


## Development
### Testing
- Unit / Model tests
- API request tests

To run all tests, type this into command line:
```
bundle exec rspec
```

#### Coverage report
  ![test Coverage](.github/images/test_coverage_screenshot.png)

### Linters
To run ***Rubocop***, go to the root directory of your repository and copy/paste the following command into your terminal:
```
rubocop .
```

## Authors
👤 **Arturo Alvarez**
- Github: [@StarSheriff2](https://github.com/StarSheriff2)
- Twitter: [@ArturoAlvarezV](https://twitter.com/ArturoAlvarezV)
- Linkedin: [Arturo Alvarez](https://www.linkedin.com/in/arturoalvarezv/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/StarSheriff2/Weather-App-Calendar---backend/issues).

## 🤝 Acknowledgements

JWT Implementation:
 - Heavy reliance on [this tutorial series to develop this JWT authentication strategy](https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://github.com/StarSheriff2/Weather-App-Calendar---backend/blob/main/LICENSE) licensed.
