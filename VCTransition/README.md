# 화면전환+데이터전달

<br/><br/><br/><br/>

## 1️⃣ 화면전환

<br/><br/>

### ✏️ 화면전환 방법 2가지

1) Present
2) Push(with. 네비)

⚠️ 두개는 양립 될수가 없습니다. Presnet 로 갔다고 pop 으로 돌아 오면 안먹습니다. 반대도 같습니다.

⚠️참고) VC2의 dissmiss 또한 VC1 의 역활임.(VC1 의 다음 화면 pointer 가 VC2를 향하고 있는데, dismiss 하게되면 VC1의 포인터가 지워지는 것)



<br/><br/><br/><br/>



### ✏️ 다양한 화면전환 경우 실습 해보기

####  ▫️Present로 이동 + 스토리보드로 네비 달고 Push 로 이동

<img width="523" alt="스크린샷 2022-07-30 15 30 41" src="https://user-images.githubusercontent.com/106936018/181877910-9424226c-0fce-41a0-b70d-efd7bdba1ed9.png">

<img width="942" alt="스크린샷 2022-07-30 15 30 53" src="https://user-images.githubusercontent.com/106936018/181877915-f2136e0d-e025-4586-b968-d71cabc4018b.png">

> ⚠️  타입캐스팅 안되어 있다?: 화면전환 만 할경우, UIViewController 만으로도 충분 하기 때문에 안해줘도됨.
> 하지만, 다음 화면 에 데이터를 전달하기 위해서, 다음화면 class **인스턴스** 프로퍼티에 접근 해야 하기 때문에, 
> 타입캐스팅을 해줘야함!!
> 전환만 목적인데 굳이 참조해서 메모리 낭비 할건 없잖아?
>
> ⚠️ 화면 이동방향 1) 앞으로 2) 뒤로
>
> * 앞으로: 인스턴스들을 생성 하면서 화면 전환을 함
> * 뒤로: 이미 앞으로 오면서 인스턴스 생성 되어 있음 -> 그래서 데이터 전달시 그냥 참조 해서 값전달



<br/><br/><br/><br/>

####  ▫️ 코드로 네비달고 Push

```swift
let sb = UIStoryboard(name: "Main", bundle: nil)
let vc = sb.instantiateViewController(withIdentifier:"VC2") 
let nav = UINavigationController(rootViewController: vc) // 네비 달아주기 
self.present(nav, animated: true, completion: nil) 
```

> ⚠️ navi로 잘 가다가 present된 모달이 나오면 네비에 있는 스택들 다 날라감. 
>
> ⚠️ 그럼 기존 Navi1스택 안에 있던 VC1 이 present(VC2) 했으면? --> 네비바도 당연히 사라짐!
> VC2 부터는 Navi1 의 제어를 안받는 다는것!
>
> 

코드를 그림그로 그려 보면 아래와 같음 

<img width="951" alt="스크린샷 2022-07-30 15 31 02" src="https://user-images.githubusercontent.com/106936018/181877922-720c2535-9766-43e0-a41b-6b3475e54fe5.png">







<br/><br/><br/><br/>



####  ▫️ 첫 화면에 네비 달아주기 

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
guard let scene = (scene as? UIWindowScene) else { return }
window = UIWindow(frame: scene.coordinateSpace.bounds)
window?.windowScene = scene
  
let sb = UIStoryboard(name: "Main", bundle: nil)
let vc = sb.instantiateViewController(withIdentifier:"VC2") as! VC2 //  첫화면은 인제 VC2 가 되는것 
self.window?.rootViewController = UINavigationController(rootViewController: vc) // 해당 VC 를 보여주겠다 --> Navi달고!!
        
window?.makeKeyAndVisible() //Window가 해당 VC 를 화면에 쏨 --> 사용자에게 보여짐.
```



<br/><br/><br/><br/>



### ✏️ 시작화면 바꾸기(with. Userdefault)

앱 시작시 로그인을 했는데도 불고하고 로그인 화면이 제일 먼저 나오면 골치 아프다.

어떤 화면을 보여줄기 관리 하는 UIWindow 객체를 이용해 SceneDelegate 에서 코드 작성

 <br/><br/><br/>



```swift
UserDefaults.standard.string(forKey: "FirstSceneDetector") == nil
```

저장 해둔 값이 없으면,  "NoneNaviViewController"로 가고
있으면, "RealMainViewController" 로 가라 

<img width="938" alt="스크린샷 2022-07-30 15 31 12" src="https://user-images.githubusercontent.com/106936018/181877931-ecf07659-9c33-427b-892e-a3e1d698eee5.png">

<br/><br/><br/>

얘를 들어) 로그인 화면 버튼 안에 아래의 코드를 심어주는 거지.
로그인 화면 버튼 눌러 지나게 되면, UsuerDefaults 에 값을 저장 시켜 놔서
첫 사진의 SceneDelegate 에 else 구문 타겠끔 해주는 아이디어! 

<img width="949" alt="스크린샷 2022-07-30 15 33 58" src="https://user-images.githubusercontent.com/106936018/181878025-002e8ee7-5cb0-4d43-88d2-3d2f6723b265.png">

<br/><br/><br/><br/>



## 2️⃣ 데이터전달

### ✏️ 화면간 데이터 소통 하는 방법 2가지

<br/><br/>

1. 동기방식의 소통

* 직접전달, 델리게이트 패턴, Clouser 를 통한 데이터 전달도 동기방식
* 휘발성 있는 전달

<br/>

2. 비동기방식의 소통

* 저장소이용 전달(Userdata, coreData, 등)

    <br/><br/><br/><br/>

### ✏️데이터 전달과 받아오기 차이점

<br/><br/>

1.  VC1 -> VC2 인스턴스를 초기화 하기 때문에 다음 화면 속성에 쉽게 접근 가능 하지만
    VC2 -> VC1 으로 갈때는, 만들어진 VC1 인스턴스 참조 해와야함

<br/>

2.  값을 화면에 표시하는 시점이 다름
    위에서 말한 것 처럼, VC1 -> VC2는 초기화 해가면서 만들어 지기 때문에, **viewDidLoad**() 에 뿌려줘도 되지만,
    VC2 -> VC1 으로 돌아 오게 되면 **viewDidLoad**() 호출 안되서, ⭐️⭐️viewWillAppear() 에 넣어 줘야됨

<br/><br/><br/><br/>

### ✏️전달, 받아오기 실습

<br/><br/>▫️ 동기방식의 데이터 전달 과 받아오기

<br/><br/>

##### 전달

<img width="904" alt="스크린샷 2022-07-30 15 34 42" src="https://user-images.githubusercontent.com/106936018/181878048-87ef6efb-2c36-408d-bf93-3b40784da660.png">

<br/><br/>

그럼 반대로 받아 올때는?

<br/><br/>

##### 받아오기

<img width="897" alt="스크린샷 2022-07-30 15 35 27" src="https://user-images.githubusercontent.com/106936018/181878073-a1003391-4c0c-4b0e-8b14-740c7c9ce125.png">

> ⚠️ 델리게이트 패턴, closure 를 통한 데이터 받아 오는 방법도 있습니다만 생략!

<br/><br/>

> ⚠️ 참조 하는 법 
>
> 프리젠트로 왔으면 
>
> ```swift
> self.presentingViewController // VC2 를 말하겠지?
> ```
>
> 네비 방법으로 왔으면
>
> ```swift
> self.navigationContorller?.viewControllers // --> [UIViewController] , 난 인덱스로 접근 해서 불러왔는데 원래 어떻게 접근해서 가져오는 거지?
> ```
>
> 

<br/><br/><br/><br/>

**근데**! 여기서 우리는 **VC3 -> VC2 로 가는 한정!!!! 해서 데이터 전달을 함** 앱에 정보를 입력 하고, 다른 화면 갔다 왔는데 그 정보가 사라져 있어... 이게 동기 방식의 한계 입니다. 

<img width="957" alt="스크린샷 2022-07-30 15 31 50" src="https://user-images.githubusercontent.com/106936018/181877957-6563e601-e493-43bc-9c4f-8525e3f77f86.png">



<br/><br/>

해결 하기 위해 비동기 방식인 데이터 전달 사용!!

<br/><br/><br/><br/>

#### ▫️ 비동기 방식으로 데이터 전달 과 받아오기

> ⚠️AppDelegate 파일을 통해서도 가능 하지만, 앱 종료후 데이터 사라짐. 여기선 UserDefaults 만 실습



<br/><br/>

##### 전달과 받아오기

<img width="946" alt="스크린샷 2022-07-30 15 31 58" src="https://user-images.githubusercontent.com/106936018/181877962-286a49bd-dcc5-476c-8f69-ac1c831616db.png">

<br/><br/>

<img width="950" alt="스크린샷 2022-07-30 15 32 09" src="https://user-images.githubusercontent.com/106936018/181877969-02b4f7be-4907-408e-8eb7-b307c17ab2b1.png">
