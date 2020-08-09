---
apiVersion: v1
kind: Service
metadata:
  name: unifi-controller
spec:
  ports:
  - name: http
    port: 8443
  type: ExternalName
  externalName: 192.168.1.2
---
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: unifi-controller
  annotations:
    kubernetes.io/ingress.class: internal
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
spec:
  rules:
  - host: "unifi-controller.${DOMAIN}"
    http:
      paths:
      - backend:
          serviceName: unifi-controller
          servicePort: 8443
  tls:
  - hosts:
    - "unifi-controller.${DOMAIN}"