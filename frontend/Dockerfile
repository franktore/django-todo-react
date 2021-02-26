# Specify a base image
FROM node:lts-alpine as build

ENV PATH /usr/local/bin:$PATH

COPY package.json ./
COPY yarn.lock ./
COPY .yarnclean ./

# Install dependencies
RUN yarn install --frozen-lockfile --ignore-platform

# Copy over everything else
# Note: By copytin all our files after running yarn install,
# any changes made to our working files (the app) does not invalidate the cache for our npm packages
# so the only way yarn install will be executed again is if we change the package.json file.
COPY . ./

# Default Environment Variables
# there are none, currently

# Run prod build (creates build dir with static files)
RUN yarn build

EXPOSE 3000

COPY entry_point.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/entry_point.sh

ENTRYPOINT [ "sh", "/entry_point.sh" ]
#CMD ["entry_point.sh"]