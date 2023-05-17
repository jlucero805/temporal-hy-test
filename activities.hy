(import temporalio [activity])
(import docker)
(import asyncio)
(require hyrule [->>])

(defn/a [activity.defn] say_hello
    [name]
    f"Hello, {name}!")

(defn/a [activity.defn] verify_container
    [image_name]
    (try
        (let [client (docker.from_env)
            containers (->> (client.containers.list)
                            (map (fn [c] c.attrs))
                            (map (fn [c] (get c "Config")))
                            (filter (fn [c] (= (get c "Image") image_name)))
                            list)]
         (if (> (len containers) 0)
            "Container running"
            "Container not running"))
        (except [e Exception]
            "Container not running")))

(if (= __name__ "__main__")
    (print (asyncio.run (verify_container "qdrant/qdrant")))
    None)



