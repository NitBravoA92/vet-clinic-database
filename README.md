# Vet Clinic Database Project

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [Vet Clinic Database Project](#vet-clinic-database-project)
- [📗 Table of Contents](#-table-of-contents)
- [📖 Vet Clinic Database ](#-vet-clinic-database-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 Vet Clinic Database <a name="about-project"></a>

**Vet Clinic Database** consists of the creation of the schema and all the necessary queries for a database of a veterinary clinic using postgreSQL

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Creating a database using the sql 'CREATE DATABASE' statement.**
- **Creating a table using the sql 'CREATE TABLE' statement.**
- **Using the 'INSERT INTO' sql statement to record data in a table.**
- **Using the 'SELECT' sql statement to query data from a table.**
- **Using aggregate functions like COUNT, MAX, MIN and AVG.**
- **Using SQL transactions**
- **Use of JOINs clauses**
- **Working with join tables**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project, you must have installed and configured the following tools in your local environment:

- [ ] PostgreSQL

### Setup

**You must ensure that you have the postgreSQL installed and the server is started before continuing.**


First clone this repository to your desired folder:

```sh
  git clone git@github.com:NitBravoA92/vet-clinic-database.git
```

Now, you need to create a database called **vet_clinic**.


### Usage

In the command line, execute the following commands one by one in the same order as below:

Note: On all commands, you must replace the `username` with your database's username and `path/to/the/project-folder/` with the path to the project folder in your local environment.

```sh
  psql -U username -d vet_clinic -f path/to/the/project-folder/schema.sql;
```
Running the above command will create a table named **animals** within it.



```sh
  psql -U username -d vet_clinic -f path/to/the/project-folder/data.sql
```
Running the above command will insert four new records into the animals table.



```sh
  psql -U username -d vet_clinic -f path/to/the/project-folder/queries.sql
```
When executing the above command, a series of queries will be made to the animals table.

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Nitcelis Bravo**

- GitHub: [Nitcelis Bravo](https://github.com/NitBravoA92)
- Twitter: [@softwareDevOne](https://twitter.com/softwareDevOne)
- LinkedIn: [Nitcelis Bravo Alcala](https://www.linkedin.com/in/nitcelis-bravo-alcala-b65340158)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> Describe 1 - 3 features you will add to the project.

- [x] **Update animals table records.**
- [x] **Add other tables to the database with different queries**
- [x] **Add "join tables"**
- [ ] **Create database performance audit**
- [ ] **Create database schema diagram**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, suggestions and feature requests are welcome!
Feel free to check the [issues page](../../issues/).

To do Contributions, please fork this repository, create a new branch and then create a Pull Request from your branch. You can find detailed description of this process in: [A Step by Step Guide to Making Your First GitHub Contribution by Brandon Morelli](https://codeburst.io/a-step-by-step-guide-to-making-your-first-github-contribution-5302260a2940)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you liked this project, give me a "Star" (clicking the star button at the beginning of this page), share this repo with your developer community or make your contributions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank my Microverse teammates for their support. They have supported me a lot in carrying out this project, giving me suggestions, good advice and solving my code doubts.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
