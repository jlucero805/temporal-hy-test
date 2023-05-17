(import asyncio)

(import workflows [SayHello DockerContainerVerificationWorkflow])

(import temporalio.client [Client])

(defn/a main []
    (let [client (await (Client.connect "134.122.20.170:7233"))
          result (await (client.execute_workflow DockerContainerVerificationWorkflow.run
                                                 "qdrant/qdranta"
                                                 :id "hello-workflow"
                                                 :task_queue "hello-task-queue"))]
          
     (print f"Result: {result}")))

(if (= __name__ "__main__")
    (asyncio.run (main))
    None)