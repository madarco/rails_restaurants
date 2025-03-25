# README

Simple Restaurant Violations API

## Setup

```bash
bundle install
```

## Run

```bash
rails db:migrate
rails console
-> ImportViolationsJob.perform_now('app/assets/data/sf_restaurants.csv')
```



## DB schema

![DB ER Diagram](./public/er.png)

![DB schema](./public/schema.png)
