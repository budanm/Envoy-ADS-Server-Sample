   41  kr delete deployment controlplane
   42  kr delete deployment policyengine
   43  kr delete deployment envoy-ingress
   44  kr delete deployment synchronizer
   45  kr get secrets
   46  export TENANT_ID=t2
   47  export TENANT_TOKEN_EP=https://akssub1.authentication.sap.hana.ondemand.com/oauth/token?grant_type=client_credentials
   48  export TENANT_CLIENT_ID=sb-apims-management-plane\!b9307
   49  export TENANT_CLIENT_SECRET=3eYyIBJpTAIWW6w3FzoaLIk4vW8=
   50  export TENANT_URL=https://apiportalmgmgt.cfapps.sap.hana.ondemand.com/resource.svc
   51  make add-tenant-secret
   52  make add-tenant-secret
   53  make add-tenant-secret
   54  export TENANT_ID=t1
   55  make add-tenant-secret
   56  kr get secrets
   57  krgp
   58  make setup-keyspace TENANT_NAME=t2
   59  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
   60  krgp
   61  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
   62  krgp
   63  kr logs synchronizer-6b7bdb95b7-g962k
   64  krgp
   65  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
   66  kegp
   67  krgp
   68  kr logs controlplane-5499c7b7f8-jjmbk
   69  krgp
   70  kr logs synchronizer-6b7bdb95b7-g962k
   71  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
   72  kr delete deployment controlplane
   73  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
   74  krgp
   75  kr logs controlplane-6f46c68c4f-5zqkd
   76  make build DOCKER_IMG_REPO_SUFFIX=perflocal
   77  make build DOCKER_IMG_REPO_SUFFIX=perflocal
   78  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perflocal
   79  krgp
   80  kr delete deployment controlplane
   81  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perflocal
   82  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perflocal
   83  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perflocal
   84  krgp
   85  krgp
   86  krgp
   87  krgp
   88  export jwt=eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vZ3B0ZXN0LmF1dGhlbnRpY2F0aW9uLnNhcC5oYW5hLm9uZGVtYW5kLmNvbS90b2tlbl9rZXlzIiwia2lkIjoia2V5LWlkLTEiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiI1YjY1MTdhZjg3NzU0NGJiODg5OGU0ZDYzMTE0MDZkNyIsImV4dF9hdHRyIjp7ImVuaGFuY2VyIjoiWFNVQUEiLCJ6ZG4iOiJncHRlc3QifSwic3ViIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhdXRob3JpdGllcyI6WyJ1YWEucmVzb3VyY2UiXSwic2NvcGUiOlsidWFhLnJlc291cmNlIl0sImNsaWVudF9pZCI6InNiLW5hLTBkNDU0NWQyLTgxYmYtNGM2ZS1iZGQ5LWMxNDM2MmU3MmZiNiF0MzM4IiwiY2lkIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhenAiOiJzYi1uYS0wZDQ1NDVkMi04MWJmLTRjNmUtYmRkOS1jMTQzNjJlNzJmYjYhdDMzOCIsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJyZXZfc2lnIjoiM2EwN2Y4NGMiLCJpYXQiOjE1NzYxNDE5OTUsImV4cCI6MTU3NjE4NTE5NSwiaXNzIjoiaHR0cDovL2dwdGVzdC5sb2NhbGhvc3Q6ODA4MC91YWEvb2F1dGgvdG9rZW4iLCJ6aWQiOiI5ZTRiMTU3Mi02Y2M2LTRiNWItOTk3OS03ZWY2Y2ZiYzQ2ODAiLCJhdWQiOlsidWFhIiwic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiXX0.bZU4nadbvhojUFYAk3VwgjBijPMfoYVUdI-dY9Eh9XI6yis2bI-tx7hHaUdfjO_MFjtn76Py-u_BMwB-ZbzwC2BruIZbxIitN12nDLf4sDT1HsCVP4QqbFTPwmxowIXMvgV5IdJnCx5rQhd_nTl2wlSiUXkBm0iA5ImH7ToHbsr5dXzEjXXrlnEFrAJB_gw4RsFFPmV3JyLXL467Go94M8jYvLYDFXQL2_Urgry-w9vFjbgGRFG55P6oLS1QlO1UU5oH4TLl_vpidgEjTjBod9xUm8etKZD_eTcJFQsY9Px6e88okmlNz0qN23XKIkb31FMXbUyCc4mGj5rhUVcVTA
   89  curl -H "Authorization: Bearer $jwt" -k  https://t1.perf.myapis.cf/perf
   90  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
   91  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perflocal
   92  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perflocal
   93  kr delete deployment controlplane
   94  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perflocal
   95  krgp
   96  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
   97  curl -H "Authorization: Bearer $jwt" -k  https://t1.perf.myapis.cf/perf
   98  cd ../..
   99  gs
  100  git add setup/makebuild/Makefile 
  101  git pull
  102  git add cmd/main/control-plane/poller/builder.go 
  103  git commit -m "adding tenantinfo in logs and new make file target for keyspace setup"
  104  git push
  105  cd setup/makebuild/
  106  make build DOCKER_IMG_REPO_SUFFIX=perf
  107  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  108  krgp
  109  kr logs controlplane-5dd9749bcf-9wpst
  110  krgp
  111  kr logs synchronizer-58486dffd-66jxx
  112  kr logs controlplane-5dd9749bcf-9wpst
  113  kr get secrets
  114  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  115  krgp
  116  kr logs controlplane-86874ccd7-fs7z8
  117  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  118  krgp
  119  kr get secrets
  120  kr delete secret tenantinfo-t1-t1
  121  kr get secrets
  122  krgp
  123  kr logs controlplane-86874ccd7-fs7z8
  124  krgp
  125  kr logs synchronizer-58486dffd-66jxx
  126  krgp
  127  kubectl -n apim-lrt exec -it cassandra-0 sh
  128  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
  129  cd ../..
  130  gs
  131  gs
  132  git add setup/makebuild/deploy-ads-on-k8s.yaml 
  133  git commit -m "adding serviceaccount to controlplane deployment to read secrets"
  134  git push
  135  cd Documents/GitHub/api-localrt-dev/
  136  gs
  137  gs
  138  git add .
  139  git commit -m "adding some more debug logs"
  140  git pull --rebase
  141  git push
  142  krgp
  143  kubectl get namespaces
  144  cd setup/makebuild/
  145  kr delete deployment controlplane
  146  kr delete deployment envoy-ingress
  147  kr delete deployment policyengine
  148  kr delete deployment synchronizer
  149  kr get secrets
  150  kr delete secret tenantinfo-t2-t2
  151  kr get secrets
  152  make build D0CKER_IMG_REPO_SUFFIX=perf
  153  make build D0CKER_IMG_REPO_SUFFIX=perf
  154  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  155  krgp
  156  make deploy-cassandra-cluster
  157  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
  158  krgp
  159  kr logs synchronizer-6b7bdb95b7-c5zps
  160  gs
  161  kr delete deployment synchronizer
  162  kr delete deployment controlplanwe
  163  kr delete deployment controlplane
  164  kr delete deployment policyengine
  165  kr delete deployment envoy-ingress
  166  krgp
  167  krgp
  168  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  169  krgp
  170  kr logs synchronizer-6b7bdb95b7-vsxhg
  171  kr delete deployment synchronizer,controlplane,policyengine,envoy-ingress
  172  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  173  make build-synchronizer DOCKER_IMG_REPO_SUFFIX=perf
  174  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  175  krgp
  176  kr logs 
  177  kr logs controlplane-c9678f9b6-wb7lc
  178  make deploy-ads DOCKER_IMG_REPO_SUFFI
  179  clear
  180  kr delete deployment envoy-ingress, policyengine, controlplane, synchronizer
  181  make build DOCKER_IMG_REPO_SUFFIX=perf
  182  krgp
  183  kr logs controlplane-c9678f9b6-wb7lc
  184  make build
  185  make deploy-ads
  186  krgp
  187  kr logs synchronizer-6d64589c8d-tg7mc
  188  kr logs synchronizer-6d64589c8d-tg7mc
  189  kr logs synchronizer-6d64589c8d-tg7mc
  190  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
  191  export TENANT_ID=t1
  192  export TENANT_TOKEN_EP=https://akssub1.authentication.sap.hana.ondemand.com/oauth/token?grant_type=client_credentials
  193  export TENANT_CLIENT_ID=sb-apims-management-plane\!b9307
  194  export TENANT_CLIENT_SECRET=3eYyIBJpTAIWW6w3FzoaLIk4vW8=
  195  export TENANT_URL=https://apiportalmgmgt.cfapps.sap.hana.ondemand.com/resource.svc
  196  make add-tenant-secret
  197  kr get secrets
  198  kr logs synchronizer-6d64589c8d-tg7mc
  199  kubectl -n apim-lrt exec -it cassandra-0 sh
  200  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
  201  kr get secrets
  202  kr delete secret tenantinfo-t1-t1
  203  krgp
  204  kr logs synchronizer-6d64589c8d-tg7mc
  205  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
  206  krgp
  207  kr logs controlplane-9d8454779-m2qcj
  208  krgp
  209  kr logs envoy-ingress-689688f7ff-pqx2x
  210  kr delete deployment envoy-ingress
  211  krgp
  212  kr logs policyengine-b5fcd87bd-nqm27 -c envoy-egress
  213  clear
  214  krgp
  215  kr logs controlplane-9d8454779-m2qcj
  216  cls
  217  clear
  218  kr delete deployment controlplane
  219  kr delete deployment policyengine
  220  cd Documents/GitHub/api-localrt-d
  221  cd Documents/GitHub/api-localrt-dev
  222  clear
  223  cd setup/makebuild/
  224  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  225  kr delete deployment controlplane
  226  krgp
  227  make build-controlplane
  228  make deploy
  229  krgp
  230  kr logs synchronizer-6d64589c8d-tg7mc
  231  krgp
  232  kr logs controlplane-9d8454779-z4rx4
  233  kr logs synchronizer-6d64589c8d-tg7mc
  234  krgp
  235  clear
  236  kr logs controlplane-9d8454779-z4rx4
  237  krg[
  238  krgp
  239  kr logs envoy-ingress-689688f7ff-gtsww
  240  cd Documents/GitHub/api-localrt-dev/
  241  cd setup/makebuild/
  242  make build
  243  cd ../..
  244  gs
  245  git add .
  246  git commit -m "adding mocked methods for adding backend and vh secret names"
  247  git pull --rebase
  248  git push
  249  krgp
  250  kr delete deployment controlplane, synchronizer, envoy-ingress, policyengine
  251  kr get deployments
  252  kr delete deployment controlplane, envoy-ingress, synchronizer
  253  kr delete deployment controlplane
  254  kr delete deployment envoy-ingress
  255  kr delete deployment synchronizer
  256  kr delete deployment synchronizer
  257  kr get deployments
  258  cd setup/makebuild/
  259  make deploy-ads
  260  krgp
  261  krgp
  262  kr logs synchronizer-6d64589c8d-294pk
  263  kr logs synchronizer-6d64589c8d-294pk
  264  echo $TENANT_ID
  265  export TENANT_ID=t1
  266  export TENANT_TOKEN_EP=https://akssub1.authentication.sap.hana.ondemand.com/oauth/token?grant_type=client_credentials
  267  export TENANT_CLIENT_ID=sb-apims-management-plane\!b9307
  268  export TENANT_CLIENT_SECRET=3eYyIBJpTAIWW6w3FzoaLIk4vW8=
  269  export TENANT_URL=https://apiportalmgmgt.cfapps.sap.hana.ondemand.com/resource.svc
  270  make add-tenant-secret
  271  kr logs synchronizer-6d64589c8d-294pk
  272  kr delete deployment envoy-ingress
  273  make deploy-ads
  274  krgp
  275  kr logs envoy-ingress-689688f7ff-sbc9m
  276  export jwt=eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vZ3B0ZXN0LmF1dGhlbnRpY2F0aW9uLnNhcC5oYW5hLm9uZGVtYW5kLmNvbS90b2tlbl9rZXlzIiwia2lkIjoia2V5LWlkLTEiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiIzN2M4M2RhNjZiYzg0YzgyYmU1NDJjNTk2ZWE5OGQ0YyIsImV4dF9hdHRyIjp7ImVuaGFuY2VyIjoiWFNVQUEiLCJ6ZG4iOiJncHRlc3QifSwic3ViIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhdXRob3JpdGllcyI6WyJ1YWEucmVzb3VyY2UiXSwic2NvcGUiOlsidWFhLnJlc291cmNlIl0sImNsaWVudF9pZCI6InNiLW5hLTBkNDU0NWQyLTgxYmYtNGM2ZS1iZGQ5LWMxNDM2MmU3MmZiNiF0MzM4IiwiY2lkIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhenAiOiJzYi1uYS0wZDQ1NDVkMi04MWJmLTRjNmUtYmRkOS1jMTQzNjJlNzJmYjYhdDMzOCIsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJyZXZfc2lnIjoiM2EwN2Y4NGMiLCJpYXQiOjE1NzYyMTg3NjIsImV4cCI6MTU3NjI2MTk2MiwiaXNzIjoiaHR0cDovL2dwdGVzdC5sb2NhbGhvc3Q6ODA4MC91YWEvb2F1dGgvdG9rZW4iLCJ6aWQiOiI5ZTRiMTU3Mi02Y2M2LTRiNWItOTk3OS03ZWY2Y2ZiYzQ2ODAiLCJhdWQiOlsidWFhIiwic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiXX0.HuH66ghjZe-csWTJqR8Yeckq8Dq5X4yXkGJ9_vxGDqjRzlEb4gU8tYQbuQEf65-ZTPb_ekdNXsfYBJ2nDmZh3dP7AyrN1x6sgvT0fbQ5peJlGcXs_sK_1nGGDD7vYo_9N9w-eG4MRAv8fU8POrtZqdFydrcORX6JURuTj9nDsLbhQbpIAcevpU5jbVd0nLwHJv0qei0O_DS0n27erDHDKg1lQ2a1kml2gcAKyQ6-t39TMYCjbkIYPaoniu063JYHDQbgbTfnxQmuMTlD3-3b1fFWt-G-7o77Jy2JY-WOsNP_IPCcZm5KcOEMm7H4mcMnVhelH8LQvPZSr1DC51iTgA
  277  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  278  krgs
  279  echo $lb
  280  make build-controlplane
  281  krg
  282  krgp
  283  kr delete deployment controlplane
  284  make deploy
  285  krgp
  286  kr curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  287  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  288  curl -H "Authorization: Bearer $jwt" -k  https://t1.perf.myapis.cf/perf
  289  cd ../..
  290  gs
  291  git add .
  292  git commit -m "adding tls temporary fix for getting secret names"
  293  git pull --rebase
  294  git push
  295  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  296  curl -H "Authorization: Bearer $jwt" -k  https://t1.perf.myapis.cf/perf
  297  cd Documents/GitHub/api-localrt-dev/
  298  echo $lb
  299  gs
  300  git pull
  301  cd setup/makebuild/
  302  make build DOCKER_IMG_REPO_SUFFIX=per
  303  make build DOCKER_IMG_REPO_SUFFIX=perf
  304  make build DOCKER_IMG_REPO_SUFFIX=perf
  305  krgp
  306  make build DOCKER_IMG_REPO_SUFFIX=perf
  307  kr delete deployment controlplane
  308  kr delete deployment envoy-ingress
  309  kr delete deployment policyengine
  310  krgp
  311  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
  312  cd Documents/GitHub/api-localrt-dev/setup/makebuild/
  313  krgp
  314  kr delete deployment synchronizer
  315  make deploy-cassandra-cluster
  316  krgp
  317  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
  318  make deploy DOCKER_IMG_REPO_SUFFIX=per
  319  make deploy DOCKER_IMG_REPO_SUFFIX=perf
  320  krgp
  321  kr logs synchronizer-6b7bdb95b7-tbrp4
  322  winpty kubectl -n apim-lrt exec -it cassandra-0 sh
  323  export jwt=eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vZ3B0ZXN0LmF1dGhlbnRpY2F0aW9uLnNhcC5oYW5hLm9uZGVtYW5kLmNvbS90b2tlbl9rZXlzIiwia2lkIjoia2V5LWlkLTEiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiJiYzU2MWZiYThmMjI0YmRlYjQ0NjA4NDFiZjNjMDFiZiIsImV4dF9hdHRyIjp7ImVuaGFuY2VyIjoiWFNVQUEiLCJ6ZG4iOiJncHRlc3QifSwic3ViIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhdXRob3JpdGllcyI6WyJ1YWEucmVzb3VyY2UiXSwic2NvcGUiOlsidWFhLnJlc291cmNlIl0sImNsaWVudF9pZCI6InNiLW5hLTBkNDU0NWQyLTgxYmYtNGM2ZS1iZGQ5LWMxNDM2MmU3MmZiNiF0MzM4IiwiY2lkIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhenAiOiJzYi1uYS0wZDQ1NDVkMi04MWJmLTRjNmUtYmRkOS1jMTQzNjJlNzJmYjYhdDMzOCIsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJyZXZfc2lnIjoiM2EwN2Y4NGMiLCJpYXQiOjE1NzY0NzE2ODksImV4cCI6MTU3NjUxNDg4OSwiaXNzIjoiaHR0cDovL2dwdGVzdC5sb2NhbGhvc3Q6ODA4MC91YWEvb2F1dGgvdG9rZW4iLCJ6aWQiOiI5ZTRiMTU3Mi02Y2M2LTRiNWItOTk3OS03ZWY2Y2ZiYzQ2ODAiLCJhdWQiOlsidWFhIiwic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiXX0.EYEQ9bKLS8UI00NNGPSAbKyUx7BJRPOlMtl3tHm47JMCbGAA5UoMd1RVYgzfVUUw5npl24BRaH7P_4IBQpjbtChwHTYnzzotrZZ13iNKn2D_eacCdLu2NAY6_mHTREBRlKRRt--IstVwTwHxIv9ws_nK_vyBFXVuY_j2I9a1fO8Fy2RRdFZZQtVHOVf8n34Ukk3ieqeMMHgVnayZFXJsYMJGxeiIk2AdYNm2EUBUqr36RKC-ceQxm5QirvRKfH-AqaVMYWXu2lSN8Gpn0UyXajHBMqu3PNvJRxwYUHA8s1JbA7az7bwsNLQ5EAT7cDrPxpGP5XE3TpyySuNiEcX9MQ
  324  export jwt=eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vZ3B0ZXN0LmF1dGhlbnRpY2F0aW9uLnNhcC5oYW5hLm9uZGVtYW5kLmNvbS90b2tlbl9rZXlzIiwia2lkIjoia2V5LWlkLTEiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiJiYzU2MWZiYThmMjI0YmRlYjQ0NjA4NDFiZjNjMDFiZiIsImV4dF9hdHRyIjp7ImVuaGFuY2VyIjoiWFNVQUEiLCJ6ZG4iOiJncHRlc3QifSwic3ViIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhdXRob3JpdGllcyI6WyJ1YWEucmVzb3VyY2UiXSwic2NvcGUiOlsidWFhLnJlc291cmNlIl0sImNsaWVudF9pZCI6InNiLW5hLTBkNDU0NWQyLTgxYmYtNGM2ZS1iZGQ5LWMxNDM2MmU3MmZiNiF0MzM4IiwiY2lkIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhenAiOiJzYi1uYS0wZDQ1NDVkMi04MWJmLTRjNmUtYmRkOS1jMTQzNjJlNzJmYjYhdDMzOCIsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJyZXZfc2lnIjoiM2EwN2Y4NGMiLCJpYXQiOjE1NzY0NzE2ODksImV4cCI6MTU3NjUxNDg4OSwiaXNzIjoiaHR0cDovL2dwdGVzdC5sb2NhbGhvc3Q6ODA4MC91YWEvb2F1dGgvdG9rZW4iLCJ6aWQiOiI5ZTRiMTU3Mi02Y2M2LTRiNWItOTk3OS03ZWY2Y2ZiYzQ2ODAiLCJhdWQiOlsidWFhIiwic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiXX0.EYEQ9bKLS8UI00NNGPSAbKyUx7BJRPOlMtl3tHm47JMCbGAA5UoMd1RVYgzfVUUw5npl24BRaH7P_4IBQpjbtChwHTYnzzotrZZ13iNKn2D_eacCdLu2NAY6_mHTREBRlKRRt--IstVwTwHxIv9ws_nK_vyBFXVuY_j2I9a1fO8Fy2RRdFZZQtVHOVf8n34Ukk3ieqeMMHgVnayZFXJsYMJGxeiIk2AdYNm2EUBUqr36RKC-ceQxm5QirvRKfH-AqaVMYWXu2lSN8Gpn0UyXajHBMqu3PNvJRxwYUHA8s1JbA7az7bwsNLQ5EAT7cDrPxpGP5XE3TpyySuNiEcX9MQ
  325  echo $jwt
  326  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  327  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  328  export jwt=eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vZ3B0ZXN0LmF1dGhlbnRpY2F0aW9uLnNhcC5oYW5hLm9uZGVtYW5kLmNvbS90b2tlbl9rZXlzIiwia2lkIjoia2V5LWlkLTEiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiJiYzU2MWZiYThmMjI0YmRlYjQ0NjA4NDFiZjNjMDFiZiIsImV4dF9hdHRyIjp7ImVuaGFuY2VyIjoiWFNVQUEiLCJ6ZG4iOiJncHRlc3QifSwic3ViIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhdXRob3JpdGllcyI6WyJ1YWEucmVzb3VyY2UiXSwic2NvcGUiOlsidWFhLnJlc291cmNlIl0sImNsaWVudF9pZCI6InNiLW5hLTBkNDU0NWQyLTgxYmYtNGM2ZS1iZGQ5LWMxNDM2MmU3MmZiNiF0MzM4IiwiY2lkIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhenAiOiJzYi1uYS0wZDQ1NDVkMi04MWJmLTRjNmUtYmRkOS1jMTQzNjJlNzJmYjYhdDMzOCIsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJyZXZfc2lnIjoiM2EwN2Y4NGMiLCJpYXQiOjE1NzY0NzE2ODksImV4cCI6MTU3NjUxNDg4OSwiaXNzIjoiaHR0cDovL2dwdGVzdC5sb2NhbGhvc3Q6ODA4MC91YWEvb2F1dGgvdG9rZW4iLCJ6aWQiOiI5ZTRiMTU3Mi02Y2M2LTRiNWItOTk3OS03ZWY2Y2ZiYzQ2ODAiLCJhdWQiOlsidWFhIiwic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiXX0.EYEQ9bKLS8UI00NNGPSAbKyUx7BJRPOlMtl3tHm47JMCbGAA5UoMd1RVYgzfVUUw5npl24BRaH7P_4IBQpjbtChwHTYnzzotrZZ13iNKn2D_eacCdLu2NAY6_mHTREBRlKRRt--IstVwTwHxIv9ws_nK_vyBFXVuY_j2I9a1fO8Fy2RRdFZZQtVHOVf8n34Ukk3ieqeMMHgVnayZFXJsYMJGxeiIk2AdYNm2EUBUqr36RKC-ceQxm5QirvRKfH-AqaVMYWXu2lSN8Gpn0UyXajHBMqu3PNvJRxwYUHA8s1JbA7az7bwsNLQ5EAT7cDrPxpGP5XE3TpyySuNiEcX9MQ
  329  echo $jwt
  330  clear
  331  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  332  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER1/A_AddressFaxNumber
  333  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER1/A_AddressFaxNumber
  334  krgp
  335  kr logs controlplane-c9678f9b6-sc4qc
  336  gs
  337  cd ../..
  338  gs
  339  git pull
  340  cd setup/makebuild/
  341  make build DOCKER_IMG_REPO_SUFFIX=perf
  342  cd ../..
  343  cd ..
  344  krgp
  345  cd api-localrt-dev/
  346  cd setup/makebuild/
  347  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  348  krgp
  349  kr delete deployment controlplan
  350  kr delete deployment controlplane
  351  kr delete deployment envoy-ingress
  352  kr delete deployment policyengine
  353  krgp
  354  make deploy DOCKER_IMG_REPO_SUFFIX=perf
  355  cd ../..
  356  gs
  357  git add cmd/main/control-plane/service/xdscallback.go 
  358  gs
  359  git commit -m "adding method for returning xds and changing cluster name"
  360  git pull
  361  git push
  362  git fetch origin
  363  git checkout origin controlplane-rejections
  364  gs
  365  gs
  366  git commit -m "changing controlplane cluster name"
  367  git push
  368  gs
  369  gs
  370  git status
  371  git merge master
  372  git status
  373  gs
  374  git push
  375  git checkout origin master
  376  exit
  377  echo $lb
  378  cd Documents/GitHub/api-localrt-dev/
  379  gs
  380  git merge master
  381  git branch
  382  git checkout master
  383  git branch
  384  gs
  385  git pull
  386  gs
  387  git pull --rebase
  388  gs
  389  git reset --hard origin/master
  390  git diff master origin/master
  391  git branch
  392  git branch -d controlplane-rejections
  393  git branch -d controlplaneerrorhandling
  394  git branch -D controlplaneerrorhandling
  395  git branch
  396  git checkou
  397  git checkout
  398  git branch
  399  git branch -r
  400  git checkout -b error-propagation
  401  git branch
  402  git merge master
  403  export jwt=eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vZ3B0ZXN0LmF1dGhlbnRpY2F0aW9uLnNhcC5oYW5hLm9uZGVtYW5kLmNvbS90b2tlbl9rZXlzIiwia2lkIjoia2V5LWlkLTEiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiJlZTM5Y2E0MDhlODA0ZjlkOWE4ODFhMGQ4M2VlNzA0MyIsImV4dF9hdHRyIjp7ImVuaGFuY2VyIjoiWFNVQUEiLCJ6ZG4iOiJncHRlc3QifSwic3ViIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhdXRob3JpdGllcyI6WyJ1YWEucmVzb3VyY2UiXSwic2NvcGUiOlsidWFhLnJlc291cmNlIl0sImNsaWVudF9pZCI6InNiLW5hLTBkNDU0NWQyLTgxYmYtNGM2ZS1iZGQ5LWMxNDM2MmU3MmZiNiF0MzM4IiwiY2lkIjoic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiLCJhenAiOiJzYi1uYS0wZDQ1NDVkMi04MWJmLTRjNmUtYmRkOS1jMTQzNjJlNzJmYjYhdDMzOCIsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJyZXZfc2lnIjoiM2EwN2Y4NGMiLCJpYXQiOjE1NzY1NTYxMzEsImV4cCI6MTU3NjU5OTMzMSwiaXNzIjoiaHR0cDovL2dwdGVzdC5sb2NhbGhvc3Q6ODA4MC91YWEvb2F1dGgvdG9rZW4iLCJ6aWQiOiI5ZTRiMTU3Mi02Y2M2LTRiNWItOTk3OS03ZWY2Y2ZiYzQ2ODAiLCJhdWQiOlsidWFhIiwic2ItbmEtMGQ0NTQ1ZDItODFiZi00YzZlLWJkZDktYzE0MzYyZTcyZmI2IXQzMzgiXX0.ZjVytFjEbj5lUEe1E42eljHNe9CuBZj_MXXXvIxMMbnpiu34UwIkSsGj2fCxHX4hu7AkpTtaZar7kT2Nld8g9YVTY34XUCFgqfyxbrTBlVVGgfG5QDqGyKXxDkiyUGF_jLWkusYJkc9oakGU8oX9ByeWH4uQwvR4eMIBHr4KvwYoJQJO85Ww0vojVDd2SB1KmSE2e4X6ayLhICeOBRHpZ9ruBql7sSCVd9XdzZuqA9_JNT-UmIYyDVQNYZSXNFRWdQfn8MQeZ9WnSJvyuPbIJBvQfGopFwR9SrvGD2efutxMB0cL4tquJTbWfYaJwgffjE61fQpMlAxrT5y5fbIFSQ
  404  curl -H "Authorization: Bearer $jwt" -k -v --connect-to t1.apim.sap.com:443:$lb:443 https://t1.apim.sap.com/API_BUSINESS_PARTNER/A_AddressFaxNumber
  405  krgs
  406  echo $lb
  407  cd setup/makebuild/
  408  make build DOCKER_IMG_REPO_SUFFIX=per
  409  make build DOCKER_IMG_REPO_SUFFIX=perf
  410  make build DOCKER_IMG_REPO_SUFFIX=perf
  411  kr delete deployment envoy-ingress
  412  kr delete deployment  controlplane
  413  kr delete deployment policyengine, synchronizer
  414  kr delete deployment synchronizer
  415  krgp
  416  krgd
  417  kr delete deployment policyengine
  418  krgp
  419  make deploy-cassandra-cluster
  420  make deploy-cassandra-cluster
  421  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  422  krgp
  423  clear
  424  kr logs controlplane-86874ccd7-vmkr6
  425  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  426  kr delete deployment controlplane
  427  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  428  krgp
  429  kr logs controlplane-86874ccd7-wkfkq
  430  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  431  kr delete deployment controlplane
  432  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  433  krgp
  434  kr logs controlplane-86874ccd7-6gzcs
  435  krgp
  436  kr logs policyengine-5c65647f7c-2p9d6 -c envoy-egress
  437  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  438  kr delete deployment controlplane
  439  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  440  krgp
  441  kr logs controlplane-86874ccd7-nr7vs
  442  kr delete deployment policyengine
  443  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  444  krgp
  445  kr logs policyengine-5c65647f7c-gvxgk -c envoy-egress
  446  krgp
  447  kr logs controlplane-86874ccd7-nr7vs
  448  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  449  kr delete deployment envoy-ingress
  450  kr delete deployment controlplane
  451  kr delete deployment policyengine
  452  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  453  krgp
  454  kr logs envoy-ingress-689688f7ff-5r447
  455  krgp
  456  kr logs controlplane-86874ccd7-rjxsx
  457  make build-controlplane DOCKER_IMAGE_REPO_SUFFIX=perf
  458  kr delete deployment envoy-ingress
  459  kr delete deployment controlplane
  460  kr delete deployment policyengine
  461  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  462  krgp
  463  kr logs controlplane-86874ccd7-ljl69
  464  krgp
  465  kr logs envoy-ingress-689688f7ff-gnvvw
  466  kr delete deployment controlplane
  467  kr delete deployment envoy-ingress
  468  kr delete deployment policyengine
  469  kr delete deployment synchronizer
  470  make build DOCKER_IMG_REPO_SUFFIX=perf
  471  krgd
  472  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  473  krgp
  474  kr logs controlplane-86874ccd7-swkjj
  475  kr logs policyengine-5c65647f7c-7fjwr -c envoy-egress
  476  krgp
  477  kr logs controlplane-86874ccd7-swkjj
  478  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  479  krgp
  480  kr delete deployment controlplane,policyengine
  481  kr delete deployment controlplane, policyengine
  482  kr delete deployment controlplane
  483  kr delete deployment policyengine
  484  krgd
  485  kr delete deployment envoy-ingress
  486  krgd
  487  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  488  krgp
  489  krgp
  490  kr logs controlplane-86874ccd7-8f8zt
  491  make build-controlplane DOCKER_IMG_REPO_SUFFIX=perf
  492  krgp
  493  kr delete deployment controlplane
  494  kr delete deployment envoy-ingress
  495  kr delete deployment policyengine
  496  make deploy-ads DOCKER_IMG_REPO_SUFFIX=perf
  497  krgp
  498  kr logs controlplane-86874ccd7-7q4xz
  499  krgp
  500  kr logs envoy-ingress-689688f7ff-t96cj
  501  cd Documents/GitHub/api-localrt-dev/
  502  cd ..
  503  cd envoyads
  504  docker-compose logs | grep xds_cluster
  505  clear
  506  docker-compose logs | grep xds_cluster
  507  docker-compose logs | grep xds_cluster
  508  docker-compose down
  509  docker-compose build
  510  krgp
  511  docker-compose ps
  512  docker-compose up -d
  513  docker-compose logs | grep xds_cluster
  514  docker-compose down
  515  docker-compose up -d
  516  docker-compose logs | grep xds_cluster
  517  docker-compose down
  518  docker-compose build
  519  docker-compose ps
  520  docker-compose up -d
  521  docker-compose logs | grep xds_cluster
  522  docker-compose logs | grep xds_cluster
  523  docker-compose logs | grep xds_cluster
  524  docker-compose logs | grep xds_cluster
  525  docker-compose down
  526  docker-compose build
  527  docker-compose build
  528  docker-compose up -d
  529  docker-compose logs | grep xds_cluster
  530  docker-compose logs | grep xds_cluster
  531  docker-compose down
  532  docker-compose build
  533  docker-compose up -d
  534  docker-compose logs | grep xds_cluster
  535  docker-compose down
  536  docker-compose build
  537  docker_compose up -d
  538  docker-compose up -d
  539  docker-compose logs | grep xds_cluster
  540  exit
