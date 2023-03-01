## Setup
- Install `docker` and `docker compose`
- In the project directory, run `docker compose up -d`
- Next run to seed data `docker exec -it sequra_disburser-web-1 rake disburser:setup`
- Access the list of disbursements through `http://localhost:3000/disbursements`

## Implementation Assumptions
- Each order is unique
- Initial state of order is 'pending'
