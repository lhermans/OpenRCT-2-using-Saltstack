openrct2/openrct2:
  dockerng.image_present:
    - force: True
    - name: openrct2/openrct2:latest

openrct2:
  dockerng.running:
    - name: openrct2
    - image: openrct2/openrct2:latest
    - port_bindings: 44444:44444/udp
