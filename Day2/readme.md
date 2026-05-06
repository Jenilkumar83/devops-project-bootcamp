## Git Long Path Fix

```bash
git config --system core.longpaths true
```

---

## Multi-Container Application

### Docker Compose

* Simplified orchestration for microservices
* Handles dependencies, health checks, centralized config

### Basic Commands

```bash
docker compose up
docker compose up -d
docker compose down
```

---

## Docker Compose File Structure

* **networks** → defined at root level, shared by all containers
* **services** → container configurations

### Common Service Options

* `cap_add`, `cap_drop` (security)
* `healthcheck`
* `networks`
* `read_only`
* `restart`
* `security_opt`
* `tmpfs`

---

## Example: Cart Service

* `cap_add`: net_bind_service (<1024)
* `depends_on`: carts_db (condition: service_healthy)
* `environment`
* `healthcheck`: interval, retries, start_period, test, timeout
* `ports`: mode, protocol, published, target

---

## Install Docker Compose

```bash
docker compose version
sudo mkdir -p /usr/local/lib/docker/cli-plugins
wget https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -O docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/lib/docker/cli-plugins/docker-compose
```

---

## Run Compose File

```bash
docker compose up
docker compose up -d
docker compose -f abc.yaml up
```
![alt text](image-13.png)

![alt text](image-14.png)
---

## Common Fix

If error:

```
failed to resolve reference / connection timed out
```

```bash
docker logout
docker login
```
![alt text](image-12.png)
---

## Access Application

```
http://localhost:8888/topology
```
![alt text](image-11.png)
---

## Manage Services

```bash
docker compose ps
docker compose ps -a
docker compose stop orders
docker compose start orders
docker compose restart orders
```
![alt text](image-10.png)
---

## Logs

```bash
docker compose logs
docker compose logs checkout
docker compose logs -f checkout
```
![alt text](image-8.png)

![alt text](image-9.png)
---

## Monitoring

```bash
docker compose stats
docker compose top
```
![alt text](image-7.png)

![alt text](image-6.png)
---

## Recreate Container

```bash
docker compose exec ui env
docker compose up -d --force-recreate ui
```
![alt text](image-5.png)

![alt text](image-3.png)

![alt text](image-4.png)
---

## Stop All

```bash
docker compose down
```
![alt text](image-2.png)
---

## Multi-Platform Docker Images

* Use when image built on `amd64` but needed on `arm64`
* Uses Docker Buildx + QEMU

---

## Install QEMU

```bash
docker run --privileged --rm tonistiigi/binfmt --install all
```

---

## Setup Buildx

```bash
docker buildx ls
docker buildx create --name multiarch --driver docker-container --use
docker buildx inspect --bootstrap
```
![alt text](image-1.png)

![alt text](image.png)
---

## Docker Hub Variables

```bash
export DOCKERHUB_USER="jenil83"
export DH_REPO="retail-ui-multiarch"
export TAG="1.0.0"
export IMAGE="${DOCKERHUB_USER}/${DH_REPO}:${TAG}"
echo $IMAGE
docker login -u "${DOCKERHUB_USER}"
```

---

## Build & Push Multi-Arch Image

```bash
DOCKER_BUILDKIT=1 docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t "${IMAGE}" \
  --push .
```
### Look for entries for linux/amd64 and linux/arm64
-docker buildx imagetools inspect "${IMAGE}"

![alt text](image-15.png)

-AMD64: Run and test the containers
![alt text](image-16.png)

# v2 version
![alt text](image-17.png)

![alt text](image-18.png)

## To check cache size
- docker system df

---
