# Critflix App

> Criftlix is the most popular web app to write - read articles about the latest Netflix shows. Simply log in to your account and start exploring.  This project consists of a simple session system with login and sign-up functionalities. You'll be redirected to the homepage where all categories will be displayed together with the most recent article written in that category. You can click the category section to browse all articles inside a single category. I also implemented a voting system for the articles where the user can vote just once for each article.


## Features

- User can log in only using the username
- User sees the homepage where the first row is the most voted article followed by all categories - listed with the most recent article's image and title
- Only logged in user can submit an article
- When the user clicks on a category inside the homepage, they can see all articles in that category
- Users can vote only once for each article.
- Users can see the full description of an article [EXTRA Feature]

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo

Check the live version demo [here](https://quiet-wave-65450.herokuapp.com/)

# Homepage
![Critflix homepage](/public/critflix_homepage.png)

# New Article's Page
![Critflix new](/public/new_article.png)

# Article's Page
![Critflix articles](/public/critflix_articles.png)

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

# IMPORTANT
**I used S3 AWS service in order to store images. Therefore, I used SECRET KEYS stored in environment variables on my development and production servers. So you won't be able to download the project, run it and submit an article with image**

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
   rails test
```

## Authors

👤 **Diego Antonio Reyes Coronado**

- Github: [@xtrmdarc](https://github.com/xtrmdarc)
- Twitter: [@diegoreyesco](https://twitter.com/DiegoAn91629127)
- Linkedin: [diegoreyesco](https://www.linkedin.com/in/diego-reyes-coronado)

## Credits

Thanks to [Nelson Sakwa](https://www.behance.net/sakwadesignstudio) for her awesome design work. I based my work on  [this](https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version) design.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!
