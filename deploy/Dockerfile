FROM gcr.io/gcp-america/bootstrap4-haml-rails:latest

# Copy latest source
COPY . /app/

SHELL ["/bin/bash", "-c"]
RUN if test -d app/assets -a -f config/application.rb; then \
      source deploy/docker-build-secrets ; \
      bundle exec rake assets:precompile; \
      rm -f deploy/docker-build-secrets; \
    fi
