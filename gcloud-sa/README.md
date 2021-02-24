# gcloud-sa

Docker image: `gcr.io/assemble-services/gcloud-sa`

A minimal Docker image providing a wrapper that authenticates `gcloud` using a service account and sends an email when the command errors.

## Cloud SQL Scaling

Scale GCP Cloud SQL instances on a schedule.

### Service Account

### Manifests

Meant to be used as a pair of `CronJob` resources:

```yaml
---
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: instance-scale-up
spec:
  schedule: "0 8 * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: scale-cloud-sql-up
              image: gcr.io/assemble-services/gcloud-sa
              args:
                - gcloud
                - sql
                - instances
                - patch
                - --project=assemble-services
                - scaling-test
                - --cpu=30
                - --memory=112.5GB
              env:
                - name: GCP_KEY_FILE_PATH
                  value: /var/auth/service-account.json
                - name: SMTP_TO
                  value: devops@domain.com
                - name: SMTP_FROM
                  value: no-reply@domain.com
                - name: SMTP_HOST
                  value: email-smtp.us-east-1.amazonaws.com
                - name: SMTP_PORT
                  value: 587
                - name: SMTP_USER
                  value: AKIAJWOBYL2QRQQUVFXQ
                - name: SMTP_PASSWORD
                  value: ASecurePassword
              volumeMounts:
                - name: cloud-sql-scaling-service-account
                  mountPath: "/var/auth"
                  readOnly: true
          volumes:
            - name: auth
              configMap:
                name: cloud-sql-scaling-service-account
                items:
                  - key: "service-account.json"
                    path: "service-account.json"
          restartPolicy: OnFailure
---
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: instance-scale-down
spec:
  schedule: "0 22 * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: scale-cloud-sql-down
              image: gcr.io/assemble-services/gcloud-sa
              args:
                - gcloud
                - sql
                - instances
                - patch
                - --project=assemble-services
                - scaling-test
                - --tier=db-f1-micro
              env:
                - name: GCP_KEY_FILE_PATH
                  value: /var/auth/service-account.json
                - name: SMTP_TO
                  value: devops@domain.com
                - name: SMTP_FROM
                  value: no-reply@domain.com
                - name: SMTP_HOST
                  value: email-smtp.us-east-1.amazonaws.com
                - name: SMTP_PORT
                  value: 587
                - name: SMTP_USER
                  value: AKIAJWOBYL2QRQQUVFXQ
                - name: SMTP_PASSWORD
                  value: ASecurePassword
              volumeMounts:
                - name: cloud-sql-scaling-service-account
                  mountPath: "/var/auth"
                  readOnly: true
          volumes:
            - name: auth
              configMap:
                name: cloud-sql-scaling-service-account
                items:
                  - key: "service-account.json"
                    path: "service-account.json"
          restartPolicy: OnFailure
```
