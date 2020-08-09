---
apiVersion: v1
kind: Service
metadata:
  name: unifi-protect
spec:
  ports:
  - name: http
    port: 7443
  type: ExternalName
  externalName: 192.168.1.2
---
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: unifi-protect
  annotations:
    kubernetes.io/ingress.class: internal
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
spec:
  rules:
  - host: "unifi-protect.${DOMAIN}"
    http:
      paths:
      - backend:
          serviceName: unifi-protect
          servicePort: 7443
  tls:
  - hosts:
    - "unifi-protect.${DOMAIN}"