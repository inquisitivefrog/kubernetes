
sre@k8s-controller-01:~$ curl -X GET -s http://127.0.0.1:8001/api/v1/resourcequotas/ | jq .kind
"ResourceQuotaList"

sre@k8s-controller-01:~$ curl -X GET -s http://127.0.0.1:8001/api/v1/resourcequotas/
{
  "kind": "ResourceQuotaList",
  "apiVersion": "v1",
  "metadata": {
    "resourceVersion": "231082"
  },
  "items": [
    {
      "metadata": {
        "name": "memorylimit",
        "namespace": "test",
        "uid": "838e44d1-3148-4d2a-b10e-fb4418517d3d",
        "resourceVersion": "195723",
        "creationTimestamp": "2024-12-06T20:57:35Z",
        "managedFields": [
          {
            "manager": "kubectl-create",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2024-12-06T20:57:35Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:spec": {
                "f:hard": {
                  ".": {},
                  "f:limits.memory": {},
                  "f:requests.memory": {}
                }
              }
            }
          },
          {
            "manager": "kube-controller-manager",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2024-12-07T02:07:20Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:status": {
                "f:hard": {
                  ".": {},
                  "f:limits.memory": {},
                  "f:requests.memory": {}
                },
                "f:used": {
                  ".": {},
                  "f:limits.memory": {},
                  "f:requests.memory": {}
                }
              }
            },
            "subresource": "status"
          }
        ]
      },
      "spec": {
        "hard": {
          "limits.memory": "1000Mi",
          "requests.memory": "512Mi"
        }
      },
      "status": {
        "hard": {
          "limits.memory": "1000Mi",
          "requests.memory": "512Mi"
        },
        "used": {
          "limits.memory": "0",
          "requests.memory": "0"
        }
      }
    }
  ]
}
