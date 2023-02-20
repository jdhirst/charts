{{ define "backupJobSpec" }}
spec:
  containers:
  - name: {{ template "firefly-db.fullname" . }}-backup-job
    image: mariadb:10.11
    imagePullPolicy: IfNotPresent
    envFrom:
    {{- if not .Values.configs.existingSecret }}
    - configMapRef:
        name: {{ template "firefly-db.fullname" . }}-config
    {{- else }}
    - secretRef:
        name: {{ .Values.configs.existingSecret }}
    {{- end }}
    command:
    - /bin/sh
    - -c
    - |
      set -e
      echo "creating backup file"
      mysqldump -h {{ template "firefly-db.fullname" . }} -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > /var/lib/backup/$MYSQL_DATABASE.sql
      ls -la
      echo "done"
    volumeMounts:
      - name: backup-storage
        mountPath: /var/lib/backup
  restartPolicy: Never
  volumes:
    - name: backup-storage
      {{- if eq .Values.backup.destination "pvc" }}
      persistentVolumeClaim:
        claimName: {{ default (printf "%s-%s" (include "firefly-db.fullname" .) "backup-storage-claim") .Values.backup.pvc.existingClaim }}
      {{- else }}
      emptyDir: {}
      {{- end }}
{{ end }}
