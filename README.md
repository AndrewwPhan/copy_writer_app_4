# Copywriter App

This is a Ruby on Rails application integrated with the OpenAI API. The Copywriter App provides an interface for creating, managing, and editing copywriting tasks using AI assistance. The app supports user authentication, task management, and database persistence.

## ✨ Features

- 🔐 User Authentication (Devise)
- 🤖 AI-powered copywriting using OpenAI
- 📋 Task creation and management
- 🛠️ CRUD operations for copywriting tasks
- 🧪 RSpec testing framework with FactoryBot, Faker, and Shoulda Matchers
- 🗄️ PostgreSQL as the production database
- 🚀 Web deployment using Heroku

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- **Ruby** (>= 3.1.6)
- **Rails** (>= 7.2.1)
- **PostgreSQL** (>= 12.x)
- **Node.js** and **Yarn** (for managing frontend dependencies)
- **Git** for version control
- **Bundler** for managing Ruby dependencies

## 🚀 Getting Started

Follow these steps to get the application up and running:

### 1️⃣ Clone the repository

```bash
git clone https://github.com/your-username/copywriter-app.git
cd copywriter-app
```

### 2️⃣ Install dependencies

```bash
bundle install
yarn install
```

### 3️⃣ Set up the database

Ensure that PostgreSQL is installed and running on your machine. Then, create and migrate the database:

```bash
rails db:create
rails db:migrate
```

### 4️⃣ Set up environment variables

Create a `.env` file to store your environment variables. For the OpenAI API, add:

```bash
OPENAI_API_KEY=your_openai_api_key
```

### 5️⃣ Set up credentials (optional)

If using Rails credentials, you can edit and add your API key as follows:

```bash
EDITOR="code --wait" bin/rails credentials:edit
```

Add the following:

```yaml
openai:
  api_key: your_openai_api_key
```

### 6️⃣ Run the application

```bash
rails server
```

The app will now be available at `http://localhost:3000`.

## 🌍 Deployment

### Deploying to Heroku

Follow these steps to deploy your application to Heroku.

1. Install the Heroku CLI if you haven't already:

```bash
curl https://cli-assets.heroku.com/install.sh | sh
```

2. Log in to Heroku:

```bash
heroku login
```

3. Create a new Heroku app:

```bash
heroku create your-app-name
```

4. Add the PostgreSQL addon:

```bash
heroku addons:create heroku-postgresql:hobby-dev
```

5. Push the code to Heroku:

```bash
git push heroku master
```

6. Run database migrations:

```bash
heroku run rails db:migrate
```

7. Set your OpenAI API key as a Heroku config variable:

```bash
heroku config:set OPENAI_API_KEY=your_openai_api_key
```

## 🧪 Testing

This app uses RSpec for testing, along with FactoryBot for test data and Shoulda Matchers for validating models.

To run the test suite:

```bash
bundle exec rspec
```

Ensure that all tests pass before pushing changes to production.

## 🛠 Technologies

- **Backend**: Ruby on Rails 7.2.1
- **Frontend**: Stimulus.js, Turbo-Rails, and Importmap
- **Database**: PostgreSQL
- **Authentication**: Devise
- **Testing**: RSpec, FactoryBot, Shoulda Matchers, Faker
- **API Integration**: OpenAI
- **Deployment**: Heroku

## 🎯 Future Improvements

- Enhance the AI capabilities to offer more advanced copywriting suggestions.
- Add user roles and permissions.
- Implement rich-text editing for copywriting tasks.
- Improve the user interface with a more robust frontend framework.

