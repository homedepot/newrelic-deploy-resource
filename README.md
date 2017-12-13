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
-   `app_id`: *Required.* The ID of your app provided by New Relic. This can be usually found in the URL of your app's main monitoring page.

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

-	`revision`: *Required.* A version number or git sha to use as a marker.
-	`description`: *Optional.* A short description of the change.
-   `changelog`: *Optional.* A log of changes or a link to the changelog.
-	`user`: *Optional.* The user marking the deploy.

```yaml
---
jobs:
- name: Mark Deploy in New Relic
  max_in_flight: 1
  plan:
  - put: new-relic
    params:
      revision: v1.0.0
      description: "release of that new, really cool feature"
      changelog: "https://github.com/user/app/releases"
      user: yoursTruly
```

See the [official documentation](http://concourse.ci/implementing-resources.html#resource-metadata) for a complete list of available metadata.