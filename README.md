# Timesheet DevOps — Spring Boot + Jenkins CI/CD pipeline

Academic DevOps project (ESPRIT, 2021) built by a team of six engineering students.
A **Spring Boot REST API** for managing companies, departments, employees, contracts,
projects and missions (internal and external), shipped through a full
**Jenkins → Maven → SonarQube → Nexus → Docker Hub** pipeline.

> Each team member worked on their own branch — mine is `Rached_Branch` (Jenkins pipeline and Docker image published as `rachedchakchouk/timesheet_img`).

## Tech stack

| Layer | Tools |
|---|---|
| Backend | Java 8, Spring Boot 2.5, Spring Web, Spring Data JPA / Hibernate, Lombok, Log4j 2 |
| Database | MySQL |
| Build & quality | Maven, JUnit, JaCoCo, SonarQube |
| CI/CD | Jenkins (declarative pipeline), Nexus (artifact repository) |
| Containers | Docker, Docker Hub |

## Domain model

`Entreprise` → `Departement` → `Employe` ↔ `Contrat` · `Projet` · `Mission` / `MissionExterne` · `Timesheet`

Layered architecture: `entity` → `repository` (Spring Data JPA) → `service` (interfaces + implementations) → `rest/control` (REST controllers).

## CI/CD pipeline (`Jenkinsfile`)

1. Checkout from GitHub
2. Maven version check, `mvn clean`
3. Package the JAR
4. Run unit tests (JUnit + JaCoCo coverage)
5. Static analysis with **SonarQube**
6. Publish the release artifact to **Nexus**
7. Build the **Docker** image and push it to Docker Hub
8. Clean up local images, then email notification on success / failure

## Sample endpoints

Base URL: `http://localhost:9090/SpringMVC/servlet`

| Method | Path | Description |
|---|---|---|
| POST | `/ajouter-employe` | Create an employee |
| GET | `/count-employe` | Count employees |
| GET | `/get-all-employe-by-entreprise` | Employees of a company |
| POST | `/ajouterContrat` | Create a contract |
| DELETE | `/deleteContratById/{id}` | Delete a contract |
| POST | `/ajouterMission` | Create a mission |
| PUT | `/update-Mission` | Update a mission |
| GET | `/getAllMissions` | List missions |

## Run locally

```bash
# MySQL running on localhost:3306 (database created automatically)
./mvnw clean package -DskipTests
java -jar target/Timesheet_DevOps-2.0.jar
```

Or with Docker:

```bash
./mvnw clean package -DskipTests
docker build -t timesheet-devops .
docker run -p 8080:8080 timesheet-devops
```

## Author

**Rached Chakchouk** — Full Stack Software Engineer (Java / Spring Boot / Angular)
[LinkedIn](https://www.linkedin.com/in/rached-chakchouk) · [Portfolio](https://rached-chakchouk.netlify.app)
