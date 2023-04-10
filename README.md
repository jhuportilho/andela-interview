**High-level overview of the implementation:**

Implementation involves creating an IAM RBAC implementation to support each of Brightwheel's engineering teams. The solution ensures that access to AWS tools and technologies is restricted based on each team's requirements, thus preventing privilege escalation attacks within IAM.

The implementation uses AWS Terraform to create IAM roles and policies to provide granular access control to different engineering teams. Each team is given access to only the AWS services they need for their specific area of product focus.


**How system users are managed:**
We used an initial scenario in which user authentication would occur due to the development environment, as it is a practice in the platform view, because teams should have more autonomy in the development environment. In QA and PROD environments, access must be more controlled to ensure stability and data protection.

**-> Login through the DEV environment**
**-> Access to QA and PROD environments must be done via cross-account role via console or cli**
**-> I activate the cloudtrail feature in the PROD environment to audit only users in the SRE group, considering the permission level and to save money**
**-> The backend team's access to EKS was implemented differently between the DEV and QA/PROD accounts due to the use of policies managed by AWS and which do not have a default read-only policy for EKS and need to be customized**


**How to use the code:**
Inside each folder of its respective function you must run the commands:

Start by deploying users into `/dev/iam_users`

`$ terraform init`

`$ terraform validate`

`$ terraform plan -var-file="../dev.tfvars"`

**Then repeat for folders with resources:**
`iam_groups`

`iam_policies`

`iam_roles`


**Assumptions made:**

We will use AWS managed policies to create the initial PoC
As possible limits of permissions regarding the DEV, QA and PROD environments were not specified. We use good practices to restrict access to the minimum necessary.

**Next steps:**

With more time, the next steps would be as follows:
Automating the AWS IAM Access Analyzer service. In line with security best practices, the resulting S3 bucket of CloudTrail data is provisioned in a separate archive account designated just for this purpose and encrypted with a KMS key.

Access Analyzer service roles are deployed to each AWS account in the organization. They have sufficient permissions to access CloudTrail data to generate least privilege policies.

The IAM management roles deployed to each account create the actual deployment roles and can adjust their permissions. Initially, each deployment role is initialized with broader permissions that are reduced based on its previous activity using the workaround described here.

Developers' CICD pipelines use the deployment functions to deploy the actual workloads to target AWS accounts.
Deploy AWS Security Hub to monitor and manage security compliance across accounts and environments.
Deploy AWS Cost Explorer to monitor and manage your AWS costs across accounts and environments.