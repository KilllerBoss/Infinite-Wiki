module.exports = {
  apps: [{
    name: 'infinite-wiki-local',
    script: 'npx',
    args: 'serve -s dist -l 3000',
    cwd: '/home/user/webapp',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'production'
    }
  }]
};