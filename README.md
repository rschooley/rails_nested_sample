### Scenario:
* parent Project has_many Tasks
* Project accepts_nested_attributes_for tasks, allow_destroy: true
* Task has a before_destroy hook that prevents destroying some Tasks (name == "no" in this case)
* task_test shows the before_destroy works as expected

but
* when a Task is marked as destroy in the hash from the form
* and the Task hooks prevents the destroy
* an error is thrown instead of save returning false

### Steps:
* in console> rake db:seed (will build a project instance, and a child task if not already there)
* in browser> navigate to /projects/1/edit
* change name, save => good
* remove task, save => good
* rerun rake db:seed (will add the task back in)
* navigate to /projects/1/edit
* rename task to "no", save => good
* remove task named "no", save => bad
