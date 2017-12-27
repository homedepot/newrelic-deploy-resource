New Relic Deploy Resource
===================================

Marks a deployment in [New Relic](https://newrelic.com).

Resource Type Configuration
---------------------------

```yaml
resource_types:
- name: newrelic-deploy-resource
  type: docker-image
  source:
    repository: crstamps2/newrelic-deploy-resource
    tag: latest
```

Source Configuration
--------------------

-	`api_key`: *Required.* The API key provided by New Relic.
- `app_id`: *Required.* The ID of your app provided by New Relic. This can be usually found in the URL of your app's main monitoring page.

```yaml
- name: new-relic
  type: newrelic-deploy-resource
  source:
    api_key: "key"
    app_id: "id"
```

Behavior
--------

### `out`: Marks a deploy in New Relic.

Marks a deploy in New Relic, with the configured parameters.

#### Parameters

-	`json_file`: *Required.* A file with the following template:
```json
{
  "revision":"v1.0", #required
  "changelog":"logs go here", #optional
  "description":"a short description" #optional
}
```
- `user`: *Optional.* The user who is marking the deployment


```yaml
---
jobs:
- name: Mark Deploy in New Relic
  max_in_flight: 1
  plan:
  - put: new-relic
    params:
      json_file: /tmp/build/put/path/to/file.json
      user: yoursTruly
```

*Please note that the path to your json file must be prepended with `/tmp/build/put/`

See the [official documentation](http://concourse.ci/implementing-resources.html#resource-metadata) for a complete list of available metadata.