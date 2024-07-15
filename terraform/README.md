
Project 1: 
ECS-5-Tier-App

This project automates the deployment of a 5-tier web application using Terraform, ensuring consistent and repeatable infrastructure setup. The application stack utilizes AWS native services and consists of:

Java Web Application: Serves the front-end and back-end logic, deployed on Amazon ECS.

Amazon RDS (MySQL): Stores relational data for the application.

Amazon MQ (RabbitMQ): Manages messaging and task queues.

Amazon ElastiCache (Memcached): Provides in-memory caching for improving application performance.

Amazon OpenSearch Service (Elasticsearch): Facilitates search and data analytics capabilities.

By leveraging AWS native services, this setup ensures high availability, scalability, and ease of management, while Terraform ensures infrastructure consistency and repeatability.
