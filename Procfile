web: bundle exec puma -t 5:5 -p ${PORT:-7000} -e ${RACK_ENV:-development}
server: bundle exec rails server -p 4000
console: bundle exec rails console
annotate: bundle exec annotate --exclude tests,fixtures,factories,serializers