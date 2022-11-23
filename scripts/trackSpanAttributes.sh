#!/usr/bin/env bash

# When Monaco supports Dynatrace settings 2.0
# These curl requests (indeed this entire script) will go away

# Track OTEL span attributes
curl -X POST "$DT_ENVIRONMENT/api/v2/settings/objects" \
-H "accept: application/json; charset=utf-8" \
-H "Authorization: Api-Token $DT_TOKEN" \
-H "Content-Type: application/json; charset=utf-8" \
-d "[{\"schemaVersion\":\"0.0.28\",\"schemaId\":\"builtin:span-attribute\",\"scope\":\"environment\",\"value\":{\"key\":\"feature_flag.provider_name\",\"masking\":\"NOT_MASKED\"}},{\"schemaVersion\":\"0.0.28\",\"schemaId\":\"builtin:span-attribute\",\"scope\":\"environment\",\"value\":{\"key\":\"feature_flag.evaluated_variant\",\"masking\":\"NOT_MASKED\"}},{\"schemaVersion\":\"0.0.28\",\"schemaId\":\"builtin:span-attribute\",\"scope\":\"environment\",\"value\":{\"key\":\"feature_flag.flag_key\",\"masking\":\"NOT_MASKED\"}}]"