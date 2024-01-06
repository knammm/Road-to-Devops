# List
listA = [1, 2, 3, "String", ["Another", "List"]]
print(listA)

# Tuple
tupleA = (1, 2, 3)
print(tupleA)

# Dictionary => Key and Value
myDict = {"Name":"knam", "Age":20, "Skill":"DevOps", "Tech":{"Cloud":"AWS", "CICD":"Jenkins", "Containers":"K8s", "GitOps":["GitLab", "ArgoCD", "Tekton"]}}
print(myDict)

# Output: {'Name': 'knam', 'Age': 20, 'Skill': 'DevOps', 'Tech': {'Cloud': 'AWS', 'CICD': 'Jenkins', 'Containers': 'K8s', 'GitOps': ['GitLab', 'ArgoCD', 'Tekton']}}

# Make it easy to read
myDict = {
    "Name":"knam", 
    "Age":20, 
    "Skill":"DevOps", 
    "Tech":
        {
            "Cloud":"AWS", 
            "CICD":"Jenkins", 
            "Containers":"K8s", 
            "GitOps":
                [
                    "GitLab", 
                    "ArgoCD", 
                    "Tekton"
                ]
        }
    }
    
# => Look quite similar to JSON format
# Change to JSON format: remove variable name (myDict). Remember to have a space between Key and Value.
# Change to YAML format: Dictionary uses ":", List uses "-". Remember to have a space between Key and Value.