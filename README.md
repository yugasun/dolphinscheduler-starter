## DolphinScheduler Starter

Run [Apache DolphinScheduler](https://dolphinscheduler.apache.org/) by standalone mode easily.

### Usage

Run:

```shell
./cli.sh start
```

Access DolphinScheduler UI by: http://localhost:12345/dolphinscheduler/ui. The default username and password are `admin/dolphinscheduler123`

> Notice: we can customize DolphinScheduler environment variables by `conf/dolphinscheduler_env.sh`.

#### DataX

If you want to use DataX, you can run below command:

```shell
./cli.sh init-datax
```

it will auto download DataX

### Develop

Before build docker image, we should download latest DolphinScheduler source code:

```shell
./cli.sh init
```

Then we can build docker image by locally:

```shell
./cli.sh build
```

#### Build for multiple platform

We can also build for multi platform image and push to docker hub:

```shell
./cli.sh push
```

### License

MIT
