docker-ce:
  pkgrepo.managed:
    - humanname: Docker Repo
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable
    - dist: xenial
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/ubuntu/gpg
    - require_in:
      - pkg: docker-ce

  pkg.installed:
    - name: docker-ce
    - refresh: True
