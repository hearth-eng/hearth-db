# Plain psql-based migration runner (hearth-db is not Flyway - real layout is
# 1-schema/, 2-seed-data/, 3-test-data/, scripts/setup.sql; see migrate-entrypoint.sh).
FROM postgres:17-alpine
RUN mkdir -p /certs
# AWS RDS CA bundle (Postgres connections use sslmode=require + this trust store),
# mirrors the pattern used in hearth-app's Dockerfile.
ADD --chmod=644 https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem /certs/rds-global-bundle.pem
COPY 1-schema/ /sql/1-schema/
COPY 2-seed-data/ /sql/2-seed-data/
COPY 3-test-data/ /sql/3-test-data/
COPY --chmod=755 migrate-entrypoint.sh /usr/local/bin/migrate-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/migrate-entrypoint.sh"]
# ECS passes: command ["migrate"], PGHOST/PGPORT/PGDATABASE/PGUSER/PGPASSWORD/PGSSLMODE/PGSSLROOTCERT.
# "migrate" is accepted as the ECS task command but is not otherwise used - the
# entrypoint always runs the fixed migration file order itself.
CMD ["migrate"]
