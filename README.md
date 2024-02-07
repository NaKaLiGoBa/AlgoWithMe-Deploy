## 배포 아키텍처



![image](https://github.com/NaKaLiGoBa/AlgoWithMe-Deploy/assets/27201209/c5a56c0c-a8bf-4b4e-92b3-b1e5eb374448)

총 네개의 pod로 구성

- FrontEnd Pod : React + serve
- BackEnd Pod : Spring Boot
- Database Pod : MySQL Server
- Nginx Pod: Nginx Proxy Server

## 배포 과정
![image](https://github.com/NaKaLiGoBa/AlgoWithMe-Deploy/assets/27201209/41f01fd2-9bf6-4e3a-a77a-79f36fd6a226)


1. 카카오 내부 도커 이미지 레지스트리에서 이미지가 빌드됨
2. 현재 레포지토리의 kustomization.yaml을 참고하여 배포 진행

## 참고사항

API 키와 같이 외부에 노출되면 안되는 값은 k8s 클러스터에 접근하여 시크릿에 저장하고 사용
